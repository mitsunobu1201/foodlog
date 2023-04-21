class Admin::CommentsController < ApplicationController
before_action :authenticate_admin!

  def index
    @comments = Comment.all
  end

  def destroy
    comment = Comment.find(params[:id])
    flash[:notice] = "ID: #{comment.id} - [#{comment.comment}]を削除しました。"
    comment.destroy
    redirect_to request.referer
  end

end
