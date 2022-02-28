import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "darkModeRoot" ]
  static classes = [ "dark" ]
  connect() {
    console.log("mode-switch controller")
  }

  toggle() {
    this.darkModeRootTarget.classList.toggle("dark")
  }
}
