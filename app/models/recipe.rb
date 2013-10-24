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
      unless self.name == r.name
        @r_ingredients = r.ingredients.map do |i|
          i.id
        end
         (@r_ingredients & @ingredients_array).size >= 3
     end
    end
  end

  def large_image
    last_four = self.image.split(//).last(4).join("").to_s
    last_five = self.image.split(//).last(5).join("").to_s
    if last_four == "=s90"
      new_end = last_four.gsub('=s90','=l180')
      sliced = self.image[0..-5]
    elsif last_five == "s.jpg"
      new_end = last_five.gsub('s.jpg','l.jpg')
      sliced = self.image[0..-6]
    elsif last_five == "s.png"
      sliced = self.image[0..-6]
      new_end = last_five.gsub('s.png','l.png')
    end
    sliced + new_end
  end

  def ingredients_unique
    self.ingredients.to_a.uniq!
  end
end