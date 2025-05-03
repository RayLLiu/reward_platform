class CreateRewards < ActiveRecord::Migration[8.1]
  def change
    create_table :rewards do |t|
      t.string :name, null: false
      t.references :user, null: false, foreign_key: true
      t.string :status, null: false
      t.string :category, null: false
      t.integer :points_required, null: false
      t.timestamps
    end
  end
end
