import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["carbonAmount"];
  static values = { initialCarbonAmount: Number };

  connect(){
    console.log("Hi from habit_controller.js")
    }

  calculateCarbonAmount(event) {
    const selectedCycle = event.target.value();
    let updatedCarbonAmount = this.initialCarbonAmountValue;

    switch (selectedCycle) {
      case "daily":
        updatedCarbonAmount *= 365;
        break;
      case "weekly":
        updatedCarbonAmount *= 52;
        break;
      case "monthly":
        updatedCarbonAmount *= 12;
        break;
    }

    this.carbonAmountTarget.textContent = updatedCarbonAmount;
  }
}
