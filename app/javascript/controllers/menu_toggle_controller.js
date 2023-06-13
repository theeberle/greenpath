import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu-toggle"
export default class extends Controller {
  static targets = ["navigation"]

  toggle() {
    this.navigationTarget.classList.toggle("active");
  }
}

// let menuToggle = document.querySelector(".menuToggle");
// let navigation = document.querySelector(".navigation");
// menuToggle.onclick = function () {
//   navigation.classList.toggle("active");
// };
