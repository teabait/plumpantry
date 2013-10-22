class CreateRecipesWithImages < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :yummly_id, null: false
      t.string :name, null: false
      t.string :image

      t.timestamps
    end
  end
end
