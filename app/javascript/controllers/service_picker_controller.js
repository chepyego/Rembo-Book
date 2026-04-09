// app/javascript/controllers/service_picker_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["dropdown", "selectedName", "hiddenField"];

  onChange(event) {
    const select = event.target;
    const serviceId = select.value;
    const optionText = select.options[select.selectedIndex]?.text;

    if (serviceId && optionText) {
      // Update hidden field (so the value is still sent)
      this.hiddenFieldTarget.value = serviceId;

      // Show the selected service name as text
      this.selectedNameTarget.textContent = "You selected: " + optionText;
      this.selectedNameTarget.classList.remove("hidden");

      // Hide the dropdown
      this.dropdownTarget.style.display = "none";
    }
  }
}
