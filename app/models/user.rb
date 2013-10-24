class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  has_and_belongs_to_many :recipes
  has_secure_password

  def favorites
    self.recipes.map do |r|
      r.name
    end
  end

  def grocery_list
      recipe_ing = self.recipes.map do |r|
        r.id
      end
      grocery_list = []
      ingredients = recipe_ing.map do |r|
        @recipe = Recipe.find_by(id:r)
        @recipe.ingredients.map do |i|
          i.name
          unless grocery_list.include?(i.name)
          grocery_list << i.name
          end
        end
      end
    
    return grocery_list.sort
  end
end

