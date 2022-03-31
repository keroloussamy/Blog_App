class LikesController < ApplicationController
  def create
    like = current_user.likes.new
    like.post_id = params[:post_id]
    like.save
    flash[:success] = 'Like added successfully'
    redirect_to user_posts_path
  end
end
