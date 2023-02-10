class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(user_id: current_user)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = RecipeFood.where(recipe_id: params[:id])
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_path
  end
end
