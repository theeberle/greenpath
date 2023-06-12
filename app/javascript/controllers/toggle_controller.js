import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["div1", "div2"];

  toggleDiv() {
    this.div1Target.classList.toggle("hidden");
    this.div2Target.classList.toggle("hidden");
  }
}
