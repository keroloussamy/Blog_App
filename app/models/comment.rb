class Comment < ApplicationRecord
  belongs_to :user, foreign_key: :users_id
  belongs_to :post, foreign_key: :posts_id

  after_save :update_post_comments_counter

  def update_post_comments_counter
    post.increment!(:comments_counter)
  end
end
