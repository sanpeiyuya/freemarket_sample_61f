class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comments_params)
    if @comment.save
      redirect_to display_item_path(params[:display_item_id])
    else
      redirect_to root_path
    end
  end

  def destroy
  end

  private
  def comments_params
    params.require(:comment).permit(:user_id, :comment, :display_item_id)
  end

end
