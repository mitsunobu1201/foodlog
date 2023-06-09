class Public::SearchesController < ApplicationController
before_action :authenticate_user!

  def index
    @word = params[:word]
    @range = params[:range]

    if @range == "User"
      @searchs = User.where("name LIKE ?", "%#{@word}%")
    elsif @range == "MyComment"
      @searchs = Comment.where("comment LIKE ? AND user_id = ?", "%#{@word}%", current_user.id)
    else
      @searchs = Comment.search_by_tag(@word)
  end
  end
end