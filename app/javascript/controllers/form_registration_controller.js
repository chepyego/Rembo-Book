import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 
    "stepOnePanel", "stepTwoPanel", 
    "stepOneIndicator", "stepTwoIndicator",
    "stepOneHeading", "stepTwoHeading",
    "subdomainInput", "subdomainPreview" 
  ]

  connect() {
    console.log("🚀 STIMULUS IS TOTALLY CONNECTED TO THE SALON FORM!");
  }

  nextStep(event) {
    event.preventDefault()
    
    // Hide Step 1 Panel & Heading
    this.stepOnePanelTarget.classList.add("hidden")
    this.stepOneHeadingTarget.classList.add("hidden")
    
    // Show Step 2 Panel & Heading
    this.stepTwoPanelTarget.classList.remove("hidden")
    this.stepTwoHeadingTarget.classList.remove("hidden")
    
    // Update progress circle indicators styling
    this.stepTwoIndicatorTarget.classList.add("bg-black", "text-white")
    this.stepTwoIndicatorTarget.classList.remove("bg-gray-200", "text-gray-500")
  }

  prevStep(event) {
    event.preventDefault()
    
    this.stepOnePanelTarget.classList.remove("hidden")
    this.stepOneHeadingTarget.classList.remove("hidden")
    
    this.stepTwoPanelTarget.classList.add("hidden")
    this.stepTwoHeadingTarget.classList.add("hidden")
    
    this.stepTwoIndicatorTarget.classList.remove("bg-black", "text-white")
    this.stepTwoIndicatorTarget.classList.add("bg-gray-200", "text-gray-500")
  }

  updateSubdomain(event) {
    const rawValue = event.target.value
    const slugified = rawValue
      .toLowerCase()
      .replace(/[^a-z0-9\s-]/g, '')
      .replace(/\s+/g, '-')
      .replace(/-+/g, '-')
      .trim()

    this.subdomainInputTarget.value = slugified
    this.subdomainPreviewTarget.textContent = slugified ? `${slugified}.rembobook.com` : "your-salon.rembobook.com"
  }
}