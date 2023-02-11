require 'rails_helper'

RSpec.describe 'Food', type: :system do
  describe 'index page' do
    before(:each) do
      @user = User.create(name: 'Tom', email: 'tom@email.com', password: 'password')
      @food = Food.create(name: 'Apple', measurement_unit: 'grams', price: 2, quantity: 3, user_id: @user.id)
      visit new_user_session_path
      fill_in 'Email', with: 'tom@email.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      sleep(1)
      visit foods_path
    end

    it 'should display the measurement unit of food' do
      expect(page).to have_content(@food.measurement_unit)
    end

    it 'should display the names of food' do
      expect(page).to have_content(@food.name)
    end

    it 'should display the price of food' do
      expect(page).to have_content(@food.price)
    end

    it 'should display a button that add new food' do
      expect(page).to have_content('Add Food')
    end

    it 'should direct to a form to add new food when Add Food button is clicked on' do
      click_link 'Add Food'
      expect("#{page.current_url}/new").to match new_food_path
    end
  end
end
