import { Controller } from "@hotwired/stimulus"

const liveTimetable = document.querySelectorAll('.gallery__picture').length - 1;

export default class extends Controller {
  static targets = [ "term", "term_one", "term_two", "term_three", "term_four" ]

  

  initialize() {
    this.index = liveTimetable
    this.showCurrentTimetable()
  }

  term_one() {
    this.index = 0
    showCurrentTimetable()
  }

  term_two() {
    this.index = 1
    showCurrentTimetable()
  }

  term_three() {
    this.index = 2
    showCurrentTimetable()
  }

  term_four() {
    this.index = 3
    showCurrentTimetable()
  }

  showCurrentTimetable() {
    this.termTargets.forEach((element, index) => {
      element.hidden = index !== this.index
    })
  }
}