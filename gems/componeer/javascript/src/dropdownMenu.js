export default dropdownMenu = function () {
  return {
    display: false,
    toggleDisplay: function () {
      this.display = !this.display
    },
    hide: function () {
      this.display = false
    },
  }
}
