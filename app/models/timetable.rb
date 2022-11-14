class Timetable < ApplicationRecord
  TERM_ONE = '1'
  TERM_TWO = '2'
  TERM_THREE = '3'
  TERM_FOUR = '4'
  has_many :class_times
  has_many :ballet_classes, through: :class_times

  validates :term, inclusion: { in: %w[1 2 3 4] }

  class << self
    def current_timeable
      current_date = Date.today
      where('start_date < ?', current_date).order('start_date desc').first
    end

    def current_term_timetable(term)
      current_year = Date.current.year
      Timetable.where('extract(year  from start_date) = ?', current_year).where(term:).first
    end
  end

  def classes_on_day(day)
    class_times.where(day_of_week: day)
  end
end
