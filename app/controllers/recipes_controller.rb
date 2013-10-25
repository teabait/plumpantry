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

    @recipes = @recipe.similar

    render :show
  end

  def favorite
    @recipe = Recipe.find_by(id:params[:id])
    current_user.recipes << @recipe
    
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

