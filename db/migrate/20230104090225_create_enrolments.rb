class CreateEnrolments < ActiveRecord::Migration[7.0]
  def change
    create_table :enrolments do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.integer :age_of_child
      t.boolean :any_prior_experience
      t.text :comments_and_queries

      t.timestamps
    end
  end
end
