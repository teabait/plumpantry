class YummlyRecipe < ActiveRecord::Base
  validates :yummly_id, :recipe_name, presence: true

end