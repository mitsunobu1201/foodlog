class Public::MealsController < ApplicationController

  def new
    @newmeal = Meal.new
    @foods = Food.all
    @selected_date = params[:date].to_date
  end


  def create
    @meal = Meal.new(meal_params)
    @meal.user_id = current_user.id
    if @meal.save

      #取得したdateを分解し、フォームで指定されたページへリダイレクトする
      year = @meal.ymd.strftime('%Y')
      month = @meal.ymd.strftime('%-m')
      day = @meal.ymd.strftime('%-d')
      redirect_to member_path(member: @meal.user_id, year: year, month: month, day: day)
    else
      render 'new'
    end
  end

  def destroy
    meal = Meal.find(params[:id])
    meal.destroy
   redirect_to request.referer
  end

  private

    def meal_params
      params.require(:meal).permit(:food_id, :ymd, :timeframe, :quantity)
    end

end
