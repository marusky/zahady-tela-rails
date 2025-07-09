import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="visibility"
export default class extends Controller {
  connect() {
    this.handleVisibilityChange = this.handleVisibilityChange.bind(this);
    document.addEventListener("visibilitychange", this.handleVisibilityChange);
  }

  disconnect() {
    document.removeEventListener("visibilitychange", this.handleVisibilityChange);
  }

  handleVisibilityChange() {
    if (document.visibilityState === "visible") {
      Turbo.visit(window.location.href, { action: "replace" });
    }
  }
}