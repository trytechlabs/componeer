const dropdownComponent = () => {
  console.log('to aqui dentro do componente dropdownComponent.js')

  return {
    display: false,
    toggleDisplay: () => {
      self.display = !self.display
    },
    hide: () => {
      self.display = false
    },
  }
}

export default dropdownComponent
