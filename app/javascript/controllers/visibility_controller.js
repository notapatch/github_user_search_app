import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="visibility"
export default class extends Controller {
  static targets = [ "hideable" ]

  connect() {
    console.log("visibility controller")
  }

  toggleTargets() {
    this.hideableTargets.forEach((el) => {
      el.classList.toggle("hidden")
    });
  }
}
