import { Controller } from "@hotwired/stimulus";


export default class extends Controller {
  static targets = ["div1", "div2"];

  connect() {
    console.log("Hello from toggle.js");
  }

  toggleDiv() {
    console.log(this.div1Target.classList);
    this.div1Target.classList.toggle("d-none");
    this.div2Target.classList.toggle("d-none");
  }
}
