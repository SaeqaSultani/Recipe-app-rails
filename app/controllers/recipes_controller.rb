class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    new_recipe = Recipe.new(name: params[:recipe][:name], preparation_time: params[:recipe][:preparation_time], cooking_time: params[:recipe][:cooking_time], description: params[:recipe][:description], public: params[:recipe][:public], user: current_user)
    if new_recipe.save
      redirect_to recipes_path, notice: 'Recipe was successfully created.'
    else
      render :new, alert: 'Recipe was not created.'
    end
  end

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
