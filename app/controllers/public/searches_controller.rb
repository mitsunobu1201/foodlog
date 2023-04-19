class Public::SearchesController < ApplicationController
before_action :authenticate_user!

  def index
    @range = params[:range]

    if @range == "User"
      @searchs = User.where("name LIKE ?", "%#{params[:word]}%")
    elsif @range == "MyComment"
      @searchs = Comment.where("comment LIKE ? AND user_id = ?", "%#{params[:word]}%", current_user.id)
    else
      @searchs = Comment.search_by_tag(params[:word])
  end
  end
end