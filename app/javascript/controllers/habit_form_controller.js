import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["carbonAmount"];
  static values = { initialCarbonAmount: Number };

  connect(){
    // console.log(parseInt(this.carbonAmountTarget.innerText))
    this.initialCarbonAmount = parseInt(this.carbonAmountTarget.innerText);
    }

  updateCarbonAmount(event) {
    console.log("hi")
    const selectedCycle = event.currentTarget.value;
    let updatedCarbonAmount = this.initialCarbonAmount;

    switch (selectedCycle) {
      case "Daily":
        updatedCarbonAmount *= 365;
        break;
      case "Weekly":
        updatedCarbonAmount *= 52;
        break;
      case "Monthly":
        updatedCarbonAmount *= 12;
        break;
    }
    // console.log(updatedCarbonAmount)

  this.carbonAmountTarget.innerText = updatedCarbonAmount;
  }
}
