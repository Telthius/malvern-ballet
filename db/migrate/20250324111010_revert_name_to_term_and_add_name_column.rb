class RevertNameToTermAndAddNameColumn < ActiveRecord::Migration[8.0]
  def change
    rename_column :timetables, :name, :term
    add_column :timetables, :name, :string, null: false, default: ''
  end
end
