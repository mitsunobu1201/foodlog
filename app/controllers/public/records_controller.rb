class Public::RecordsController < ApplicationController
  before_action :authenticate_user!

  def index

    #1年、1ヶ月、1週間のレコード取得
    @records_y = Meal.where(user_id: current_user.id).where('ymd >= ?', 1.year.ago)
    @records_m = Meal.where(user_id: current_user.id).where('ymd >= ?', 1.month.ago)
    @records_w = Meal.where(user_id: current_user.id).where('ymd >= ?', 1.week.ago)

    #1年、1ヶ月、1週間のレコードの数を取得
    @records_dates_y = Meal.where(user_id: current_user.id).where("ymd >= ?", 1.year.ago).group(:ymd).distinct.count
    @records_dates_m = Meal.where(user_id: current_user.id).where("ymd >= ?", 1.month.ago).group(:ymd).distinct.count
    @records_dates_w = Meal.where(user_id: current_user.id).where("ymd >= ?", 1.week.ago).group(:ymd).distinct.count

    @top_meals = Meal.select("food_id, SUM(quantity) as total_quantity").where(user_id: current_user.id).group(:food_id).order("SUM(quantity) DESC").limit(3).map { |meal| [meal.food_id, meal.total_quantity] }

  end

end


