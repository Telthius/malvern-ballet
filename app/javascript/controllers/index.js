// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import HeaderController from "./header_controller"
application.register("header", HeaderController)

import RemovalsController from "./removals_controller"
application.register("removals", RemovalsController)

import SubmitController from "./submit_controller"
application.register("submit", SubmitController)

import TimetableController from "./timetable_controller"
application.register("timetable", TimetableController)
