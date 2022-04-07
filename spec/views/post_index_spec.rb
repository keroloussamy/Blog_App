require 'rails_helper'

feature 'Post Index' do
  describe 'Post Index' do
    background do
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
      click_on 'See all Posts'
    end

    scenario '1- I can see the users profile picture.' do
      image = page.all('img')
      expect(image.size).to eql(1)
    end

    scenario '2- I can see the users username.' do
      expect(page).to have_content('kero')
    end

    scenario '3- I can see the number of posts the user has written.' do
      expect(page).to have_content('Number of posts:')
    end

    scenario '4- I can see a posts title.' do
      expect(page).to have_content('title post')
    end

    scenario '5- I can see some of the posts body.' do
      expect(page).to have_content('text post')
    end

    scenario '6- I can see the first comments on a post.' do
      expect(page).to have_content 'Comment 1'
    end

    scenario '7- I can see how many comments a post has.' do
      expect(page).to have_content 'Comments:'
    end

    scenario '8- I can see how many likes a post has.' do
      expect(page).to have_content 'Likes:'
    end

    scenario '9- I can see a section for pagination if there are more posts than fit on the view.' do
      expect(page).to have_content 'Pagination'
    end

    scenario '10- When I click on a post, it redirects me to that posts show page.' do
      click_on 'title post'
      expect(page).to have_current_path user_post_path(@user, @post)
    end
  end
end
