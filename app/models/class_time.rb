class ClassTime < ApplicationRecord
  MONDAY = 'Monday'
  TUESDAY = 'Tuesday'
  WEDNESDAY = 'Wednesday'
  THURSDAY = 'Thursday'
  FRIDAY = 'Friday'
  SATURDAY = 'Saturday'
  SUNDAY = 'Sunday'

  belongs_to :ballet_class
  belongs_to :timetable

  validates :day_of_week, inclusion: { in: %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday] }
end
