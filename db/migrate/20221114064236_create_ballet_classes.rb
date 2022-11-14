class CreateBalletClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :ballet_classes do |t|
      t.belongs_to :ballet_level
      t.timestamps
    end
  end
end
