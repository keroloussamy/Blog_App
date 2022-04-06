require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  describe 'login' do
    before(:each) do
      User.create! name: 'kero', password: '123456', email: 'kero@gmail.com',
                   confirmed_at: Time.now
      visit new_user_session_path
    end

    it '1- I can see the username and password inputs and the "Submit" button.' do
      expect(page).to have_content('Log in')
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
    end

    it '2- When I click the submit button without filling in the username and the password, I get a detailed error.' do
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it '3- When I click the submit button after filling in the username and the password with incorrect data, I get a detailed error.' do
      fill_in 'Email', with: 'wrong@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it '4- When I click the submit button after filling in the username and the password with correct data, I am redirected to the root page.' do
      fill_in 'Email', with: 'kero@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully.')
      expect(page).to have_current_path root_path
    end
  end
end