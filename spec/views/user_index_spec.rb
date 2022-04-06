require 'rails_helper'

RSpec.describe 'User Index', type: :feature do
  describe 'User Index' do
    before(:each) do
      @user = User.create! name: 'kero', password: '123456', email: 'kero@gmail.com', confirmed_at: Time.now
      visit new_user_session_path
      fill_in 'Email', with: 'kero@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit root_path
    end

    it '1- I can see the username of all other users.' do
      expect(page).to have_content('kero')
    end

    it '2- I can see the profile picture for each user.' do
      image = page.all('img')
      expect(image.size).to eql(1)
    end

    it '3- I can see the number of posts each user has written.' do
      expect(page).to have_content('Number of posts:')
    end

    it '4- When I click the submit button after filling in the username
    and the password with correct data, I am redirected to the root page.' do
      click_on 'kero'
      expect(page).to have_current_path user_path(@user)
    end
  end
end
