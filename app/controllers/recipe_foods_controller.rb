class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
    @foods = Food.all
  end

  def create
    new_recipe_food = RecipeFood.new(quantity: params[:recipe_food][:quantity], recipe: Recipe.find(params[:recipe_id]), food: Food.find(params[:recipe_food][:food_id]))
    if new_recipe_food.save
      redirect_to recipe_path(params[:recipe_id]), notice: 'Recipe Food was successfully created.'
    else
      render :new, alert: 'Recipe Food was not created.'
    end
  end
end
