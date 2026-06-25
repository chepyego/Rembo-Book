import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["google", "facebook"]

  connect() {
    this.googleTarget.textContent = "Coming soon"
    this.googleTarget.disabled = true
    this.facebookTarget.textContent = "Coming soon"
    this.facebookTarget.disabled = true
  }
}