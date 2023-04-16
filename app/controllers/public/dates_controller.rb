class Public::DatesController < ApplicationController
  before_action :authenticate_user!
  def show
    @member = User.find(params[:id])
    @user_dates = Meal.where(user_id: @member.id).group(:ymd).order(ymd: :desc).distinct
  end
end
