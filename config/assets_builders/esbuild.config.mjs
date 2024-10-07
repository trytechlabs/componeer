#!/usr/bin/env node

import * as esbuild from 'esbuild'
import path from 'path'
import rails from 'esbuild-rails'
import { polyfillNode } from 'esbuild-plugin-polyfill-node'

const entryPoints = ['application.js']

let additionalPaths = function () {
  return {
    name: 'additional-paths',
    setup(build) {
      build.onResolve({ filter: /^componeer$/ }, (args) => {
        const result = path.join(
          process.cwd(),
          'gems',
          args.path,
          'javascript/dist/index.js'
        )

        return {
          path: result,
        }
      })
    },
  }
}

const context = await esbuild.context({
  absWorkingDir: path.join(process.cwd(), 'app/javascript'),
  bundle: true,
  entryPoints: entryPoints,
  outdir: path.join(process.cwd(), 'app/assets/builds'),
  sourcemap: true,
  plugins: [additionalPaths(), polyfillNode({}), rails()],
})

if (process.argv.includes('--watch')) {
  await context.watch()
} else {
  await context.rebuild()
  await context.dispose()
}
