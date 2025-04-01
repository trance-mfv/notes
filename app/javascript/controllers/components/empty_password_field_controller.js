import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["field"]

  connect() {
    console.log('this.element.tagName', this.element.tagName)
    console.log('this.fieldTargets', this.fieldTarget)
    if (this.element.tagName === "FORM") {
      this.element.addEventListener("submit", this.handleSubmit.bind(this))
    }
  }

  handleSubmit(event) {
    this.removeEmptyFields()
  }

  removeEmptyFields() {
    this.fieldTargets.forEach((input) => {
      if (!input.value.trim()) {
        input.remove()
      }
    })
  }
}
