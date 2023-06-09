class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.comment_user_id = current_user.id
    if @comment.save
    redirect_to request.referer
     end
  end

  def destroy

    comment = Comment.find(params[:id])

    if current_user.id == comment.user_id
      comment.destroy
      redirect_to request.referer
    else
      member_path
    end
  end


private

def comment_params
  params.require(:comment).permit(:comment,:ymd,:timeframe,:user_id)
end
end