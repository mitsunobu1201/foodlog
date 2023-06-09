class Public::MealsController < ApplicationController
  before_action :authenticate_user!

  def new
    @newmeal = Meal.new
    @foods = Food.where(user_id: current_user.id)
    @selected_date = params[:date].to_date
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.user_id = current_user.id
    if @meal.save
      # 取得したdateを分解し、フォームで指定されたページへリダイレクトする
      year = @meal.ymd.strftime('%Y')
      month = @meal.ymd.strftime('%-m')
      day = @meal.ymd.strftime('%-d')
      redirect_to member_path(id: @meal.user_id, member: @meal.user_id, year: year, month: month, day: day)
    else
      render 'new'
    end
  end

  def destroy
    meal = Meal.find(params[:id])

    if current_user.id == meal.user_id
      meal.destroy
      redirect_to request.referer
    else
      food_path
    end
  end

  private

  def meal_params
    params.require(:meal).permit(:food_id, :ymd, :timeframe, :quantity)
  end
end
