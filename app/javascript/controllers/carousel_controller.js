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

  filterChallenges(event) {
    const categoryId = event.target.dataset.categoryId;

    // Show/hide challenges and categories based on the selected category
    const challenges = document.querySelectorAll(".challenge-card");
    challenges.forEach((challenge) => {
      const challengeCategoryId = challenge.dataset.categoryId;
      if (categoryId === "all" || challengeCategoryId === categoryId) {
        challenge.style.display = "block";
      } else {
        challenge.style.display = "none";
      }
    });

    const categoryContainers = this.categoryContainerTargets;
    categoryContainers.forEach((container) => {
      const containerCategoryId = container.dataset.categoryId;
      if (categoryId === "all" || containerCategoryId === categoryId) {
        container.style.display = "block";
      } else {
        container.style.display = "none";
      }
    });
  }
}
