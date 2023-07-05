import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carousel"
export default class extends Controller {
  static targets = ["category", "categoryContainer"];

  connect() {

  }

  initialize() {
    // Add event listeners to the category indicators
    this.categoryTargets.forEach((target) => {
      target.addEventListener("click", this.filterChallenges.bind(this));
    });
  }

  // Show/hide challenges and categories based on the selected category
  filterChallenges(event) {
    // Get the categoryId from the dataset of the clicked target element in the event
    const categoryId = event.target.dataset.categoryId;

    // Get all challenge elements with the class "challenge-card" and store them in challenges
    const challenges = document.querySelectorAll(".challenge-card");
    // Iterate over each challenge element in challenges:
    challenges.forEach((challenge) => {
      // Get the challenges within the challenge section
      const challengeCategoryId = challenge.dataset.categoryId;
      if (categoryId === "all" || challengeCategoryId === categoryId) {
        challenge.style.display = "block";
      } else {
        challenge.style.display = "none";
      }
    });

    const categoryContainers = this.categoryContainerTargets;
    // Iterate over each categoryContainer element in categoryContainers:
    categoryContainers.forEach((container) => {
      // Get the catogory within the category section
      const containerCategoryId = container.dataset.categoryId;
      if (categoryId === "all" || containerCategoryId === categoryId) {
        container.style.display = "block";
      } else {
        container.style.display = "none";
      }
    });
  }
}
