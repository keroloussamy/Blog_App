class Api::CommentsController < ApplicationController
  def index
    @comments = Post.find(params[:post_id]).comments
    render json: @comments
  end

  def create
    # user = current_user
    # user = User.find(params[:user_id])
    @comment = Comment.new(comment_params)
    @comment.author = user

    if @comment.save
      @comment.comments_counter
      render json: @comment
    else
      render json: 'Error creating comment'
    end
  end

  def comment_params
    params.permit(
      :text,
      :post_id
    )
  end
end