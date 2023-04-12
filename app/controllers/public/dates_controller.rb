class Public::DatesController < ApplicationController

  def show
    @member = User.find(params[:id])
    @user_dates = Meal.where(user_id: @member.id).group(:ymd).order(ymd: :desc).distinct
  end
end
