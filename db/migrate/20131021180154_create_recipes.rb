class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.json :yummly_object, null: false

      t.timestamps
    end
  end
end
