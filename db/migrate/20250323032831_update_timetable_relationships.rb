class UpdateTimetableRelationships < ActiveRecord::Migration[8.0]
  def change
    # Add timetable_id to ballet_classes
    add_reference :ballet_classes, :timetable, foreign_key: true

    # Remove timetable_id from class_times without assuming foreign key exists
    remove_column :class_times, :timetable_id
  end
end
