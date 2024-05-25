#!/usr/bin/env node

import fs from 'fs'
import path from 'path'
import { spawn } from 'child_process'

const SOURCE_FOLDER = './app/assets/stylesheets/'
const OUTPUT_FOLDER = './app/assets/builds/'
const isWatch = process.argv.includes('--watch')
const isMinify = process.env.NODE_ENV === 'production'

const createTailwindCommand = (file) => {
  const inputPath = path.join(SOURCE_FOLDER, file)
  const outputFilename = file.replace('.tailwind.css', '.css')
  const outputPath = path.join(OUTPUT_FOLDER, outputFilename)
  const commandArgs = [
    '-i',
    inputPath,
    '-o',
    outputPath,
    ...(isWatch ? ['--watch'] : []),
    ...(isMinify ? ['--minify'] : []),
  ]

  return { commandArgs, outputFilename }
}

fs.readdir(SOURCE_FOLDER, (err, files) => {
  if (err) {
    console.error(`Could not read the directory: ${err}`)
    return
  }

  const tailwindFiles = files.filter((file) => file.endsWith('.tailwind.css'))
  const commands = tailwindFiles.map(createTailwindCommand)

  console.log('CSS build has been started')
  console.log('=======================================')

  commands.forEach(({ commandArgs, outputFilename }) => {
    const tailwindProcess = spawn('tailwindcss', commandArgs)
    const tag = `\x1b[35m[CSS Build]\x1b[0m\x1b[32m[${outputFilename}]\x1b[0m`

    console.log(`${tag}: ${isWatch ? 'Watching...' : 'Started...'}`)

    tailwindProcess.stderr.on('data', (data) => {
      const lines = data
        .toString()
        .split('\n')
        .filter((line) => line.trim() !== '')

      lines.forEach((line) => {
        console.log(`${tag}: ${line.trim()}`)
      })
    })
  })
})
