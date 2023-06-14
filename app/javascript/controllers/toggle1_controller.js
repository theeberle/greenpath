import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-habits"
export default class extends Controller {
  static targets = ["togglableElement"];

  connect() {
    console.log("Hello from habitshow_controller.js");
  }

  fire() {
    console.log(this.togglableElementTarget);
    this.togglableElementTarget.classList.toggle("d-none");
  }

}
