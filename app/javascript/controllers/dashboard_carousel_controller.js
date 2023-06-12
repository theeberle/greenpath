import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["day", "carousel"];

  connect() {
    this.filterDays();
  }

  filterDays() {
    const totalDays = 10; // Total number of upcoming days to display
    const currentDate = new Date();

    this.dayTargets.forEach((day) => {
      const dayOffset = parseInt(day.dataset.dayOffset);
      const currentDay = new Date(currentDate.getTime() + dayOffset * 24 * 60 * 60 * 1000);

      if (dayOffset >= 0 && dayOffset < totalDays) {
        day.style.display = "block";
        day.querySelector("td").textContent = currentDay.toLocaleDateString("en-US", { weekday: "long" });

        const events = day.querySelectorAll(".event");
        events.forEach((event) => {
          const eventDate = new Date(event.dataset.eventDate);
          if (eventDate.toDateString() === currentDay.toDateString()) {
            event.style.display = "block";
          } else {
            event.style.display = "none";
          }
        });
      } else {
        day.style.display = "none";
      }
    });

    // Initialize the carousel if it's available
    if (this.hasCarouselTarget) {
      this.carouselTarget.classList.add("initialized");
    }
  }
}
