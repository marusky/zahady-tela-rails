// controllers/progress_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["bar"];

  connect() {
    this.totalTime = 20;
    this.count = this.totalTime;

    this.intervalId = setInterval(() => {
      this.count--;

      const percentage = (this.count / this.totalTime) * 100;
      this.barTarget.style.width = `${percentage}%`;

      if (this.count <= 0) {
        clearInterval(this.intervalId);
        this.barTarget.style.width = '0%';
      }
    }, 1000);
  }

  disconnect() {
    clearInterval(this.intervalId);
  }
}
