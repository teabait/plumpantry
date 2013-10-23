class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def index
    @recipes = Recipe.all
    render :index
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
    # That recipe's ingredients into a searchable array
    @ingredients_array = @ingredients.map do |i|
      i.id
    end

    @recipes = Recipe.all
    @similar = @recipes.select do |r|
      (@r_ingredients = r.ingredients.map do |i|
        i.id
      end)
       (@r_ingredients & @ingredients_array).size >= 3
    end


    render :show
  end
end