class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :prepration_time
      t.integer :cooking_time
      t.string :description
      t.boolean :publik
      t.references :users, null: false, foreign_key: true
      t.timestamps
    end
  end
end