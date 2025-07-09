import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="evaluation"
export default class extends Controller {
  connect() {
    const body = document.getElementsByTagName("body")[0]
    if (this.element.dataset.correct === "true") {
      body.style.backgroundColor = "#0fd19a";
    } else {
      body.style.backgroundColor = "#eb2d53";
    }
  }
}
