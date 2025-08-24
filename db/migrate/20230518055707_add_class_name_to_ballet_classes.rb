class AddClassNameToBalletClasses < ActiveRecord::Migration[7.0]
  def change
    add_column :ballet_classes, :class_name, :string
  end
end
