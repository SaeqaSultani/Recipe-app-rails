class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.where(public: true).order('updated_at DESC')
    @recipe_foods = RecipeFood.all
  end
end
