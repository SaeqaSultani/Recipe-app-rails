require 'rails_helper'

RSpec.describe 'Recipe', type: :system do
  describe 'index page' do
    before(:each) do
      @user = User.create(name: 'Tom', email: 'tom@email.com', password: 'password')
      @recipe = Recipe.create(name: 'Cheeseburger Soup', preparation_time: '12:05', cooking_time: '6:45',
                              description: 'Lorem ipsum dolor sit', user_id: @user.id, public: false)
      visit new_user_session_path
      fill_in 'Email', with: 'tom@email.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      sleep(1)
      visit recipes_path
    end

    it 'should display the name of the recipe' do
      expect(page).to have_content(@recipe.name)
    end

    it 'should diaplay the description of the recipe' do
      expect(page).to have_content(@recipe.description)
    end

    it 'should display a button to remove the user\'s recipe' do
      expect(page).to have_content('Remove')
    end
  end
end
