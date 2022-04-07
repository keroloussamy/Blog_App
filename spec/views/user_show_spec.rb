require 'rails_helper'

RSpec.describe 'User Show', type: :feature do
  describe 'User Show' do
    before(:each) do
      @user = User.create! name: 'kero', password: '123456', email: 'kero@gmail.com', confirmed_at: Time.now
      @user1 = User.create! name: 'Will', password: '123456', email: 'will@gmail.com', confirmed_at: Time.now
      @post1 = @user.posts.create!(title: 'title 1', text: 'text 1')
      @post2 = @user.posts.create!(title: 'title 2', text: 'text 2')
      @post3 = @user.posts.create!(title: 'title 3', text: 'text 3')
      visit new_user_session_path
      fill_in 'Email', with: 'kero@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit root_path
      click_on 'kero'
    end

    it '1- I can see the users profile picture.' do
      image = page.all('img')
      expect(image.size).to eql(1)
    end

    it '2- I can see the users username.' do
      expect(page).to have_content('kero')
      expect(page).to have_content('Will')
    end

    it '3- I can see the number of posts the user has written.' do
      expect(page).to have_content('Number of posts:')
    end

    it '4- I can see the users bio.' do
      expect(page).to have_content('Bio')
    end

    it '5- I can see the users first 3 posts.' do
      expect(page).to have_content 'text 1'
      expect(page).to have_content 'text 2'
      expect(page).to have_content 'text 3'
      expect(page).to have_content 'title 1'
      expect(page).to have_content 'title 2'
      expect(page).to have_content 'title 3'
    end

    it '6- I can see a button that lets me view all of a users posts.' do
      expect(page).to have_content 'See all Posts'
    end

    it '7- When I click a users post, it redirects me to that posts show page.' do
      click_on 'title 1'
      expect(page).to have_current_path user_post_path(@user, @post1)
    end

    it '8- When I click to see all posts, it redirects me to the users posts index page.' do
      click_on 'See all Posts'
      expect(page).to have_current_path user_posts_path(@user)
    end
  end
end
