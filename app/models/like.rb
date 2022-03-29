class Like < ApplicationRecord
  belongs_to :author, foreign_key: :author_id
  belongs_to :post, foreign_key: :post_id

  after_save :update_post_likes_counter

  def update_post_likes_counter
    post.increment!(:likes_counter)
  end
end
