class RenameTimetableTermToName < ActiveRecord::Migration[8.0]
  def change
    rename_column :timetables, :term, :name
  end
end
