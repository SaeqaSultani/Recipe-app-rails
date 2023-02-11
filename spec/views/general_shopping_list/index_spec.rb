require 'rails_helper'

RSpec.describe 'General Shopping', type: :system do
  describe 'index page' do
    before(:each) do
      @user_one = User.create(name: 'Tom', email: 'tom@email.com', password: 'password')

      visit new_user_session_path
      fill_in 'Email', with: 'tom@email.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      sleep(1)
      visit general_shopping_list_index_path
    end

    it 'should display the shopping list heading' do
      expect(page).to have_content('Shopping List')
    end

    it 'should display the total price of all the missing ingredients heading' do
      expect(page).to have_content('Total value of food needed:')
    end

    it 'should display the total price of all the missing ingredients heading' do
      expect(page).to have_content('Amount of food items to buy:')
    end
  end
end
