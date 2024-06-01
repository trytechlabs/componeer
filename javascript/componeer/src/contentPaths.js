const path = require('path');
const { execSync } = require('child_process');

const contentPaths = function() {
  try {
    const command = 'gem which componeer';
    const stdout = execSync(command).toString();
    const gemPath = path.dirname(stdout.trim());
    const contentPaths = path.join(gemPath, '../app/components/**/*.{rb,erb,yml}');

    return [contentPaths];
  } catch (error) {
    console.error(`Error: ${error.message}`);
  }
}

export default contentPaths;
