class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  after_save :update_post_user_counter

  validates :title, presence: true
  validates :text, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_post_user_counter
    author.increment!(:posts_counter)
  end

  def last_five_comments
    comments.last(5)
  end
end
