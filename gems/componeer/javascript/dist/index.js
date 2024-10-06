var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
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
var __toCommonJS = (mod) => __copyProps(__defProp({}, "__esModule", { value: true }), mod);

// index.js
var javascript_exports = {};
__export(javascript_exports, {
  default: () => javascript_default
});
module.exports = __toCommonJS(javascript_exports);

// src/dropdownMenu.js
var dropdownMenu_default = dropdownMenu = function() {
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

// index.js
var Componeer = {
  dropdownMenu: dropdownMenu_default
};
var javascript_default = Componeer;
//# sourceMappingURL=index.js.map
