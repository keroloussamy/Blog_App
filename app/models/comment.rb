class Comment < ApplicationRecord
  belongs_to :user, foreign_key: :users_id
  belongs_to :post, foreign_key: :posts_id

  after_save :update_post_comment_counter

  def update_post_comment_counter
    post.update(comments_counter: post.comments.counter)
  end
end
