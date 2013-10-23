class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
    render :index
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    render :show
  end
end