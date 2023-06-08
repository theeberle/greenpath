import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carousel"
export default class extends Controller {
  static targets = ["category"];

  connect() {

  }

  initialize() {
    // Add event listeners to the category indicators
    this.categoryTargets.forEach((target) => {
      target.addEventListener("click", this.filterChallenges.bind(this));
    });
  }

  filterChallenges(event) {
    const categoryId = event.target.dataset.categoryId;

    // Show/hide challenges based on the selected category
    const challenges = document.querySelectorAll(".challenge-card");
    challenges.forEach((challenge) => {
      const challengeCategoryId = challenge.dataset.categoryId;
      if (categoryId === "all" || challengeCategoryId === categoryId) {
        challenge.style.display = "block";
      } else {
        challenge.style.display = "none";
      }
    });
  }
}
