class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
    @foods = Food.where(user_id: current_user)
  end

  def create
    new_recipe_food = RecipeFood.new(quantity: params[:recipe_food][:quantity], recipe: Recipe.find(params[:recipe_id]), food: Food.find(params[:recipe_food][:food_id]))
    if new_recipe_food.save
      redirect_to recipe_path(params[:recipe_id]), notice: 'Recipe Food was successfully created.'
    else
      render :new, alert: 'Recipe Food was not created.'
    end
  end

  def destroy
    recipe_food = RecipeFood.find(params[:id])
    recipe_food.destroy
    redirect_to recipe_path(params[:recipe_id])
  end
end
