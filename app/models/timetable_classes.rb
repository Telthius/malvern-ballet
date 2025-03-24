# Holds the different classes held on a given day
class TimetableClasses
  attr_reader :term, :empty, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday

  def initialize(timetable, term = '')
    if timetable
      define_timetable_classes(timetable)
    else
      define_empty_timetable(term)
    end
  end

  def define_timetable_classes(timetable)
    @term = timetable.name
    @monday = timetable&.classes_on_day(ClassTime::MONDAY)
    @tuesday = timetable&.classes_on_day(ClassTime::TUESDAY)
    @wednesday = timetable&.classes_on_day(ClassTime::WEDNESDAY)
    @thursday = timetable&.classes_on_day(ClassTime::THURSDAY)
    @friday = timetable&.classes_on_day(ClassTime::FRIDAY)
    @saturday = timetable&.classes_on_day(ClassTime::SATURDAY)
  end

  def define_empty_timetable(term)
    @empty = true
    @term = term
  end
end
