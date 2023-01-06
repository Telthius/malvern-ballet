class CreateCosts < ActiveRecord::Migration[7.0]
  def change
    create_table :costs do |t|
      t.belongs_to :ballet_level
      t.float :amount
      t.string :condition
      t.timestamps
    end
  end
end
