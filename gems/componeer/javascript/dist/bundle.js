(function () {
  'use strict';

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
  };

  var contentPaths$1 = contentPaths();

  const dropdownComponent = () => {
    console.log('to aqui dentro do componente dropdownComponent.js');

    return {
      display: false,
      toggleDisplay: () => {
        self.display = !self.display;
      },
      hide: () => {
        self.display = false;
      },
    }
  };

  const Componeer = {
    contentPaths: contentPaths$1,
    dropdownComponent,
  };

  return Componeer;

})();
