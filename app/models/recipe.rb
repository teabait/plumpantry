class Recipe < ActiveRecord::Base
  validates :yummly_id, presence: true

  has_and_belongs_to_many :users
  has_and_belongs_to_many :ingredients

  def similar
    recipes = Recipe.all
    ingredients = self.ingredients
    @ingredients_array = ingredients.map do |i|
      i.id
    end
    @similar = recipes.select do |r|
      #set array of ingredient ids to @r_ingredients
      @r_ingredients = r.ingredients.map do |i|
        i.id
      end
      #find intersection of @r_ingredients to this recipe's ingredients
       (@r_ingredients & @ingredients_array).size >= 3
    end
  end
end