import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="visibility"
export default class extends Controller {
  static targets = [ "hideable" ]

  connect() {
    console.log("visibility controller")
  }

  showTargets() {
    this.hideableTargets.forEach(el => {
      el.classList.remove("hidden")
    });
  }

  hideTargets() {
    this.hideableTargets.forEach(el => {
      el.classList.add("hidden")
    });
  }

  toggleTargets() {
    this.hideableTargets.forEach((el) => {
      el.classList.toggle("hidden")
    });
  }
}
