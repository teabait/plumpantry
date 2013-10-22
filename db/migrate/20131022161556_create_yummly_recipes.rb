class CreateYummlyRecipes < ActiveRecord::Migration
  def change
    create_table :yummly_recipes do |t|
      t.string :yummly_id, null: false
      t.string :yummly_name, null: false

      t.timestamps
    end
  end
end
