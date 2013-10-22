class DropRecipesYummlyRecipes < ActiveRecord::Migration
  def up
    drop_table :recipes_users
    drop_table :ingredients_recipes
    drop_table :recipes
    drop_table :yummly_recipes
  end

  def down
    create_table :recipes do |t|
      t.json :yummly_object, null: false

      t.timestamps
    end

    create_table :yummly_recipes do |t|
      t.string :yummly_id, null: false
      t.string :yummly_name, null: false

      t.timestamps
    end

    create_table :recipes_users do |t|
      t.belongs_to :user, null: false
      t.belongs_to :recipe, null: false
    end

    create_table :ingredients_recipes do |t|
      t.belongs_to :recipe, null: false
      t.belongs_to :ingredient, null: false
    end
  end
end
