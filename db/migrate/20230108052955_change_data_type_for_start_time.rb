class ChangeDataTypeForStartTime < ActiveRecord::Migration[7.0]
  def change
    remove_column :class_times, :start_time, :string
    remove_column :class_times, :end_time, :string
    add_column :class_times, :start_time, :time
    add_column :class_times, :end_time, :time
  end
end
