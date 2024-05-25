#!/usr/bin/env node

import * as esbuild from 'esbuild'
import path from 'path'
import rails from 'esbuild-rails'
import { polyfillNode } from 'esbuild-plugin-polyfill-node'

const entryPoints = ['application.js']

let qsUtilPath = function () {
  return {
    name: 'qs-util-path',
    setup(build) {
      build.onResolve({ filter: /util\.inspect$/ }, (args) => {
        return { path: path.join(args.resolveDir, args.path + '.js') }
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
  plugins: [polyfillNode({}), rails()],
})

if (process.argv.includes('--watch')) {
  await context.watch()
} else {
  await context.rebuild()
  await context.dispose()
}
