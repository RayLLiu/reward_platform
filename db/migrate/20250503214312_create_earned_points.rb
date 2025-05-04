class CreateEarnedPoints < ActiveRecord::Migration[8.1]
  def change
    create_table :earned_points do |t|
      t.string :merchant, null: false
      t.references :user, null: false, foreign_key: true
      t.decimal :amount, null: false
      t.integer :point, null: false
      t.timestamps
    end
  end
end
