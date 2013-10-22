class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def index
    @season = "fall"
    render :index
  end

  def show
  end
end