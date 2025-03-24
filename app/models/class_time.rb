class ClassTime < ApplicationRecord
  MONDAY = 'Monday'
  TUESDAY = 'Tuesday'
  WEDNESDAY = 'Wednesday'
  THURSDAY = 'Thursday'
  FRIDAY = 'Friday'
  SATURDAY = 'Saturday'
  SUNDAY = 'Sunday'

  belongs_to :ballet_class

  validates :day_of_week, inclusion: { in: %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday] }
  validates :start_time, presence: true
  validates :end_time, presence: true

  scope :ordered, -> { order(start_time: :asc) }
end
