class PostsController < ApplicationController
  def index
    @user = User.includes(:posts, :comments).find(params[:user_id])
  end

  def show
    @post = User.find(params[:user_id]).posts.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
  end

  def create
    @post = current_user.posts.create(post_params)
    flash[:success] = 'Post create successfully'
    redirect_to user_posts_path(current_user.id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
