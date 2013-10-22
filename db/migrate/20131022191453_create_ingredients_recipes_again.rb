class CreateIngredientsRecipesAgain < ActiveRecord::Migration
  def change
    create_table :ingredients_recipes do |t|
      t.belongs_to :recipe, null: false
      t.belongs_to :ingredient, null: false
    end


    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE ingredients_recipes
          ADD CONSTRAINT fk_recipes
          FOREIGN KEY (recipe_id)
          REFERENCES recipes(id),
          ADD CONSTRAINT fk_ingredients
          FOREIGN KEY (ingredient_id)
          REFERENCES ingredients(id)
        SQL
      end
    end
  end
end
