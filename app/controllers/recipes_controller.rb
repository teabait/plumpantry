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
    render :show
  end
end