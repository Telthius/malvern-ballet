class Timetable < ApplicationRecord
  TERM_ONE = '1'
  TERM_TWO = '2'
  TERM_THREE = '3'
  TERM_FOUR = '4'
  has_many :ballet_classes
  has_many :class_times, through: :ballet_classes

  validates :term, inclusion: { in: %w[1 2 3 4] }
  validates :name, presence: true

  class << self
    def current_timetable
      current_date = Date.today+1
      current_timetable = current_years_timetables.where('start_date < ?', (current_date+1)).order('start_date desc').first

      return current_term_timetable(1) unless current_timetable

      current_timetable
    end

    def current_years_timetables
      where('extract(year  from start_date) = ?', current_year)
    end

    def current_term_timetable(term)
      current_years_timetables.where(term:).first
    end

    def current_year
      Date.current.year
    end
  end

  def classes_on_day(day)
    class_times.where(day_of_week: day).order(start_time: :asc)
  end

  private_class_method :current_year
end
