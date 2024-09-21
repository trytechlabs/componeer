var __create = Object.create;
var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __getProtoOf = Object.getPrototypeOf;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __export = (target, all) => {
  for (var name in all)
    __defProp(target, name, { get: all[name], enumerable: true });
};
var __copyProps = (to, from, except, desc) => {
  if (from && typeof from === "object" || typeof from === "function") {
    for (let key of __getOwnPropNames(from))
      if (!__hasOwnProp.call(to, key) && key !== except)
        __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
  }
  return to;
};
var __toESM = (mod, isNodeMode, target) => (target = mod != null ? __create(__getProtoOf(mod)) : {}, __copyProps(
  // If the importer is in node compatibility mode or this is not an ESM
  // file that has been converted to a CommonJS file using a Babel-
  // compatible transform (i.e. "__esModule" has not been set), then set
  // "default" to the CommonJS "module.exports" for node compatibility.
  isNodeMode || !mod || !mod.__esModule ? __defProp(target, "default", { value: mod, enumerable: true }) : target,
  mod
));
var __toCommonJS = (mod) => __copyProps(__defProp({}, "__esModule", { value: true }), mod);

// index.js
var javascript_exports = {};
__export(javascript_exports, {
  default: () => javascript_default
});
module.exports = __toCommonJS(javascript_exports);

// src/contentPaths.js
var import_path = __toESM(require("path"));
var import_child_process = require("child_process");
var contentPaths = function() {
  try {
    const command = "gem which componeer";
    const stdout = (0, import_child_process.execSync)(command).toString();
    const gemPath = import_path.default.dirname(stdout.trim());
    const contentPaths2 = import_path.default.join(gemPath, "../app/components/**/*.{rb,erb,yml}");
    return [contentPaths2];
  } catch (error) {
    console.error(`Error: ${error.message}`);
  }
};
var contentPaths_default = contentPaths();

// src/dropdownComponent.js
var dropdownComponent = () => {
  return {
    display: false,
    toggleDisplay: function() {
      this.display = !this.display;
    },
    hide: function() {
      this.display = false;
    }
  };
};
var dropdownComponent_default = dropdownComponent;

// index.js
var Componeer = {
  contentPaths: contentPaths_default,
  dropdownComponent: dropdownComponent_default
};
var javascript_default = Componeer;
//# sourceMappingURL=index.js.map
