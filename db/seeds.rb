
Yummly.search('smoothie', params={'maxResult'=>100 }).each do |recipe|
    
    @yummly_id = recipe.id
    @yummly_recipe_name = recipe.recipe_name
    @yummly_image = recipe.images[0].small_url unless recipe.images[0].nil?
    yummly_recipe = Recipe.find_or_initialize_by(name: @yummly_recipe_name, yummly_id: @yummly_id, image: @yummly_image)

    unless recipe.ingredients.nil?
      recipe.ingredients.each do |i|
        ingredient = Ingredient.find_or_initialize_by(name: i)
        yummly_recipe.ingredients << ingredient
      end
    end

    yummly_recipe.save
  end

