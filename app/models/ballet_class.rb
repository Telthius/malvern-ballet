class BalletClass < ApplicationRecord
  belongs_to :ballet_level
  belongs_to :timetable
  has_many :class_times, dependent: :destroy
  accepts_nested_attributes_for :class_times
  validates :ballet_level_id, presence: true
  validates :class_name, presence: true
end
