#!/usr/bin/env node

import * as esbuild from 'esbuild'
import path from 'path'
import { execSync } from 'child_process'

const entryPoints = ['index.js']

let upgradeComponeerModules = {
  name: 'Upgrade componeer lib on node_modules',
  setup(build) {
    build.onEnd(_result => {
      const command = 'yarn upgrade @trytechlabs/componeer'
      const { stdout, stderr } = execSync(command)
      if (stdout) { console.log(stdout.toString()) }
      if (stderr) { console.error(stderr.toString()) }
    })
  },
}

const context = await esbuild.context({
  absWorkingDir: path.join(process.cwd(), 'gems/componeer/javascript'),
  bundle: true,
  entryPoints: entryPoints,
  outdir: path.join(process.cwd(), 'gems/componeer/javascript/dist'),
  sourcemap: true,
  platform: 'node',
  plugins: [upgradeComponeerModules],
})

if (process.argv.includes('--watch')) {
  await context.watch()
} else {
  await context.rebuild()
  await context.dispose()
}
