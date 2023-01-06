import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [
    "headercont",
    "logocont",
    "home",
    "other",
    "logohome",
    "logoother",
    "timetable",
    "classes",
    "bootybarre",
    "menu",
  ];
  static classes = ["logo", "blue", "pictureout", "underline"];

  otherTargetConnected() {
    this.logocontTarget.classList.add(this.logoClass);
    this.headercontTarget.classList.add(this.blueClass);
    this.logohomeTarget.classList.add(this.pictureoutClass);
    this.logootherTarget.classList.remove(this.pictureoutClass);
  }

  homeTargetConnected() {
    this.logocontTarget.classList.remove(this.logoClass);
    this.headercontTarget.classList.remove(this.blueClass);
    this.logootherTarget.classList.add(this.pictureoutClass);
    this.logohomeTarget.classList.remove(this.pictureoutClass);
  }
}
