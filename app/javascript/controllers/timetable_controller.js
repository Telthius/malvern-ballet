import { Controller } from "@hotwired/stimulus"

const liveTimetable = document.querySelectorAll('.gallery__picture').length - 1;

export default class extends Controller {
  static values = { index: String }
  static targets = [ "term1", "term2", "term3", "term4" ]
  static classes = ["term"]

  initialize() {
    this.my_target = this.find_target(this.indexValue)
    this.my_target.classList.add(this.termClass)
  }

  find_target(value) {
    switch (value) {
      case '1':
        return this.term1Target
    }
    switch (value) {
      case '2':
        return this.term2Target
    }
    switch (value) {
      case '3':
        return this.term3Target
    }
    switch (value) {
      case '4':
        return this.term4Target
    }
  }
}