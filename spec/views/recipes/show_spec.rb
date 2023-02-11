require 'rails_helper'

RSpec.describe 'Recipe show view', type: :system do
  describe 'Show page' do
    before(:each) do
      @user = User.create(name: 'Tom', email: 'tom@email.com', password: 'password')
      @food = Food.create(name: 'Apple', measurement_unit: 'grams', price: 2, quantity: 3, user_id: @user.id)
      @recipe = Recipe.create(name: 'Cheeseburger Soup', preparation_time: '12:05', cooking_time: '6:45',
                              description: 'Lorem ipsum dolor sit', user_id: @user.id, public: false)
      @first_ingredient = RecipeFood.create(recipe_id: @recipe.id, food_id: @food.id, quantity: 1)

      visit new_user_session_path
      fill_in 'Email', with: 'tom@email.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      sleep(1)
      visit recipe_path(@recipe.id)
    end

    it 'Can see recipe name' do
      expect(page).to have_content(@recipe.name)
    end

    it 'Can see recipe preparation time' do
      expect(page).to have_content(@recipe.preparation_time)
    end

    it 'Can see recipe cooking time' do
      expect(page).to have_content(@recipe.cooking_time)
    end

    it 'Can see recipe ingredients' do
      expect(page).to have_content(@food.name)
    end

    it 'Can see a button that lets a user add new ingredients' do
      expect(page).to have_content('Add Ingredient')
    end

    it 'Can click on add new ingredient, to be redirected to a form to add new ingredient' do
      click_link 'Add Ingredient'
      expect("/recipes/#{@recipe.id}/recipe_foods/new").to match new_recipe_recipe_food_path(@recipe.id)
    end
  end
end
