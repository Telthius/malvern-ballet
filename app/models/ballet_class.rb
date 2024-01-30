class BalletClass < ApplicationRecord
  belongs_to :ballet_level
  has_many :class_times, :dependent => :destroy
  has_one :timetable, through: :class_times
  accepts_nested_attributes_for :class_times
  validates :ballet_level_id, presence: true
  validates :class_name, presence: true
end
