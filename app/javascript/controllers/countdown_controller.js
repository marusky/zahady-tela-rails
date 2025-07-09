import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="countdown"
export default class extends Controller {
  static targets = ["bar", "countdown"];

  connect() {
    const totalTime = 20;
    var count = totalTime;

    const intervalId = setInterval(() => {
      count--;
      if (this.hasCountdownTarget) {
        this.countdownTarget.innerText = count;
      }

      if (this.hasBarTarget) {
        const percentage = ((count - 1) / (totalTime - 1)) * 100;
        this.barTarget.style.width = `${percentage}%`;
      }

      if (count <= 0) {
        clearInterval(intervalId);

        if (this.hasBarTarget) {
          this.barTarget.style.width = '0%';
        }
      }
    }, 1000)
  }
}
