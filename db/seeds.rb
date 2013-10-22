Yummly.search('fall', maxResult=100).each do |recipe|
    @yummly_id = recipe.recipe_id
    @yummly_recipe_name = recipe.recipe_name
    yummly_recipe = YummlyRecipe.new(yummly_name: "#{@yummly_recipe_name}", yummly_id: "#{@yummly_id}")
    yummly_recipe.save
  end

