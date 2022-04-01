require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    Comment.create(
      author: User.create(
        name: 'Tom1',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Teacher from Mexico.',
        posts_counter: 1
      ),
      post: Post.create(
        author: User.create(
          name: 'Tom1',
          photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
          bio: 'Teacher from Mexico.',
          posts_counter: 1
        ),
        title: 'Hello',
        text: 'This is my first post',
        comments_counter: 1,
        likes_counter: 1
      ),
      text: 'hello'
    )
  end

  it 'update_post_comments_counter should update post comments counter' do
    expect(subject.post.comments_counter).to eq(2)
  end
end
