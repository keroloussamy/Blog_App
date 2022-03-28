class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :user, foreign_key: :users_id

  after_save :update_post_user_counter

  def update_post_user_counter
    user.update(posts_counter: user.posts.counter)
  end

  def last_five_comments
    comments.last(5)
  end
end
