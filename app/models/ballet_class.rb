class BalletClass < ApplicationRecord
  belongs_to :ballet_level
  has_many :class_times
  has_one :timetable, through: :class_times
end
