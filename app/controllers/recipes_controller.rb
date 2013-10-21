class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def show
  end

  def index
    render :index
  end
end