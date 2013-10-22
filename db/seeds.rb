Yummly.search('fall', params={'maxResult'=>100 }).each do |recipe|
    @yummly_id = recipe.id
    @yummly_recipe_name = recipe.recipe_name
    @yummly_image = recipe.images[0].small_url
    yummly_recipe = YummlyRecipe.new(name: @yummly_recipe_name, yummly_id: @yummly_id, image: @yummly_image)

    recipe.ingredients.each do |i|
      ingredient = Ingredient.find_or_initalize_by(name: i)
      yummly_recipe.ingredients << ingredient
    end

    yummly_recipe.save
  end

