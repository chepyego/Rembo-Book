import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu2"]

   
  
  toggle(){
    this.menu2Target.classList.toggle("hidden")
  }

}
