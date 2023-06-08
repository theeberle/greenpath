import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["carousel", "category", "challenge"];

  connect() {
    this.carousel = new bootstrap.Carousel(this.carouselTarget, {
      interval: false,
    });
  }

  showCategory(event) {
    const categoryIndex = event.target.dataset.categoryIndex;
    this.carousel.to(parseInt(categoryIndex));
  }
}
