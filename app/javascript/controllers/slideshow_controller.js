import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = [ "slide", "next", "previous" ]

  

  initialize() {
    this.index = 0
    this.showCurrentSlide()
  }

  next() {
    const galleryLengthIndex = document.querySelectorAll('.gallery__picture').length - 1;
    if (this.index < galleryLengthIndex) {
      this.index++
      this.showCurrentSlide()
      if (this.index == galleryLengthIndex) {
        this.hideNextButton()
      }
      this.showPreviousButton()
    }
  }

  previous() {
    if (this.index > 0) {
      this.index--
      this.showCurrentSlide()
      if (this.index == 0) {
        this.hidePreviousButton()
      }
      this.showNextButton()
    }
  }

  showCurrentSlide() {
    this.slideTargets.forEach((element, index) => {
      element.hidden = index !== this.index
    })
  }

  hideNextButton() {
    this.nextTarget.hidden = true
  }

  showNextButton() {
    this.nextTarget.hidden = false
  }

  hidePreviousButton() {
    this.previousTarget.hidden = true
  }

  showPreviousButton() {
    this.previousTarget.hidden = false
  }
}