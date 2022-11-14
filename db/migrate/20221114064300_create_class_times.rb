class CreateClassTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :class_times do |t|
      t.belongs_to :ballet_class
      t.belongs_to :timetable
      t.string :day_of_week, null: false
      t.string :start_time, null: false
      t.string :end_time, null: false
      t.timestamps
    end
  end
end
