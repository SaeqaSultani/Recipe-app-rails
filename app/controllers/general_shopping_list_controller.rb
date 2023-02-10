class GeneralShoppingListController < ApplicationController
  def index
    @recipe_foods = RecipeFood.all
    @shopping_list = []
    @total = 0
    @recipe_foods.each do |recipe_food|
      if recipe_food.food.user_id != current_user.id
        @shopping_list.push(recipe_food)
        @total += (recipe_food.food.price * recipe_food.quantity)
      end
    end
  end
end
