class CreateRecipesUsers < ActiveRecord::Migration
  def change
    create_table :recipes_users do |t|
      t.belongs_to :user, null: false
      t.belongs_to :recipe, null: false
    end


    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE recipes_users
          ADD CONSTRAINT fk_users
          FOREIGN KEY (user_id)
          REFERENCES users(id),
          ADD CONSTRAINT fk_recipes
          FOREIGN KEY (recipe_id)
          REFERENCES recipes(id)
        SQL
      end
    end
  end
end
