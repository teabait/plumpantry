class RecipesController < ApplicationController
  before_action:current_user

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
      #set array of ingredient ids to @r_ingredients
      @r_ingredients = r.ingredients.map do |i|
        i.id
      end
      #find intersection of @r_ingredients to this recipe's ingredients
       (@r_ingredients & @ingredients_array).size >= 3
    end
    render :show
  end

  def favorite
    @recipe = Recipe.find_by(id:params[:id])
    @current_user.recipes << @recipe
    
    if @recipe.persisted?
      redirect_to user_path(current_user)
    else
      render :show
    end
  end

  def remove
    @recipe = Recipe.find_by(id:params[:id])
    @current_user.recipes.delete(@recipe)
    
    if @recipe.persisted?
      redirect_to user_path(current_user)
    else
      render :show
    end
  end
end

