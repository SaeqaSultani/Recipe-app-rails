class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:user).where(public: true).order('updated_at DESC')
    @recipe_foods = RecipeFood.includes(:food).all
  end
end
