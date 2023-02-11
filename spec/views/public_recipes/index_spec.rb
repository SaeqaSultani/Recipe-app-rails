require 'rails_helper'

RSpec.describe 'Public Recipes', type: :system do
  describe 'index page' do
    before(:each) do
      @user = User.create(name: 'Tom', email: 'tom@email.com', password: 'password')
      @recipe = Recipe.create(name: 'Cheeseburger Soup', preparation_time: '12:05', cooking_time: '6:45',
                              description: 'Lorem ipsum dolor sit', user_id: @user.id, public: true)

      visit new_user_session_path
      fill_in 'Email', with: 'tom@email.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      sleep(1)
      visit root_path
    end

    it 'should display the name of recipe' do
      expect(page).to have_content(@recipe.name)
    end

    it 'should display the name of the recipe owner' do
      expect(page).to have_content(@user.name)
    end

    it 'should display the public recipe heading' do
      expect(page).to have_content('Public Recipe(s)')
    end
  end
end
