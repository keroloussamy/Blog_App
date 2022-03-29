class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :author, foreign_key: :author_id

  after_save :update_post_user_counter

  def update_post_user_counter
    author.increment!(:posts_counter)
  end

  def last_five_comments
    comments.last(5)
  end
end
