require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { 
    Like.create(
      author: User.create(name: 'Tom1', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 1), 
      post: Post.create(author: User.create(name: 'Tom1', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 1), 
      title: 'Hello', text: 'This is my first post', comments_counter: 1, likes_counter: 1)
    )
  }
 
  it 'update_post_likes_counter should update post likes counter' do 
    expect(subject.post.likes_counter).to eq(2)
  end 
end
