import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["carouselInner", "carouselDayContent", "event"];

  connect() {
    this.showCurrentSlide();
  }

  showCurrentSlide() {
    const carouselItems = Array.from(this.carouselInnerTarget.children);
    carouselItems.forEach((item, index) => {
      item.classList.toggle("active", index === this.currentIndex);
    });
  }

  filterEvents(event) {
    const clickedDayContent = event.currentTarget;
    const selectedDay = clickedDayContent.dataset.day;

    // Hide all events
    this.eventTargets.forEach((event) => {
      event.classList.add("hidden");
    });

    // Show events for the selected day
    const filteredEvents = this.eventTargets.filter((event) => {
      return event.dataset.day === selectedDay;
    });

    filteredEvents.forEach((event) => {
      event.classList.remove("hidden");
    });
  }
}

