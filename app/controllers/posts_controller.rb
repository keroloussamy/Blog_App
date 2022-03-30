class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @post = User.find(params[:user_id]).posts.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.create(post_params)
    redirect_to user_posts_path(@user) # users/1/posts
    # redirect_to user_path(@user) # users/1/
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end
end
