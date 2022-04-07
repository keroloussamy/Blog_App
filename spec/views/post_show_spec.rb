require 'rails_helper'

RSpec.describe 'Post Show', type: :feature do
  describe 'Post Show' do
    before(:each) do
      @user = User.create! name: 'kero', password: '123456', email: 'kero@gmail.com', confirmed_at: Time.now
      @post = @user.posts.create!(title: 'title post', text: 'text post')
      @comment1 = @post.comments.create!(text: 'Comment 1', author_id: @user.id)
      @comment2 = @post.comments.create!(text: 'Comment 2', author_id: @user.id)
      visit new_user_session_path
      fill_in 'Email', with: 'kero@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit root_path
      click_on 'kero'
      click_on 'title post'
    end

    it '1- I can see a posts title.' do
      expect(page).to have_content('title post')
    end

    it '2- I can see some of the posts body.' do
      expect(page).to have_content('text post')
    end

    it '3- I can see how many comments it has' do
      expect(page).to have_content 'Comments:'
    end

    it '4- I can see how many likes it has' do
      expect(page).to have_content 'Likes:'
    end

    it '5- I can see a posts body.' do
      expect(page).to have_content('text post')
    end

    it '6- I can see the username of each commentor.' do
      expect(page).to have_content('kero')
    end
    it '9- I can see the comment each commentor left.' do
      expect(page).to have_content('Comment 1')
    end
  end
end
