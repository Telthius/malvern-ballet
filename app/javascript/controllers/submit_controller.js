import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["submit", "button", "text", "image", "error"];
  static classes = ["button", "text", "image"];

  submitTargetDisconnected() {
    console.log("hi");
    this.buttonTarget.classList.add(this.buttonClass);
    // this.textTarget.classList.add(this.textClass);
    this.imageTarget.classList.add(this.imageClass);
    this.errorTarget.remove();
  }
}
