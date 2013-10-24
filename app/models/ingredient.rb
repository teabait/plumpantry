class Ingredient < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
    has_and_belongs_to_many :recipes

    def recipe_suggest
      self.recipes.each do |r|
        suggested_recipes = []
        suggested_recipes << r
        suggested_recipes.uniq!
      end
   end
end

