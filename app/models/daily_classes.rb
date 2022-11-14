# Holds the different classes held on a given day
class DailyClasses
  attr_reader :monday, :tuesday, :wednesday, :thursday, :friday, :saturday

  def initialize(timetable)
    @monday = timetable&.classes_on_day(ClassTime::MONDAY)
    @tuesday = timetable&.classes_on_day(ClassTime::TUESDAY)
    @wednesday = timetable&.classes_on_day(ClassTime::WEDNESDAY)
    @thursday = timetable&.classes_on_day(ClassTime::THURSDAY)
    @friday = timetable&.classes_on_day(ClassTime::FRIDAY)
    @saturday = timetable&.classes_on_day(ClassTime::SATURDAY)
  end
end