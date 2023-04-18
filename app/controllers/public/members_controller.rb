class Public::MembersController < ApplicationController
  before_action :authenticate_user!

  def index
    @members = User.all
  end

  def show
    @member = User.find(params[:id])
    @current_member = current_user


    #パラメーターから日付を取得し、日付と曜日を表示する
    @year = params[:year].to_i
    @month = params[:month].to_i
    @day = params[:day].to_i
    @date = Date.new(@year, @month, @day)
    @weekday = @date.wday
    @days = ["日曜日", "月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日"]

    #昨日の日付を取得
    @yesterday = Date.new(@year, @month, @day).-1

    #明日の日付を取得
    @tomorrow = Date.new(@year, @month, @day).+1

    #今日の日付取得
    @today = Time.zone.today

    #パラメーターの日付からその日のカラムのみ取得
    @meals_morning= Meal.where(ymd: @date,timeframe: 0,user_id:@member) #朝食
    @meals_lunch = Meal.where(ymd: @date,timeframe: 1,user_id:@member) #昼食
    @meals_dinner = Meal.where(ymd: @date,timeframe: 2,user_id:@member) #夕食
    @meals_snack = Meal.where(ymd: @date,timeframe: 3,user_id:@member) #間食

    #コメント機能
    @comment = Comment.new
    @comments_morning = Comment.where(ymd: @date,timeframe: 0,user_id:@member) #朝食コメント
    @comments_lunch = Comment.where(ymd: @date,timeframe: 1,user_id:@member) #昼食コメント
    @comments_dinner = Comment.where(ymd: @date,timeframe: 2,user_id:@member) #夕食コメント
    @comments_snack = Comment.where(ymd: @date,timeframe: 3,user_id:@member) #間食コメント

    #いいね機能
    @nices_morning = Nice.where(ymd: @date,timeframe: "morning",user_id:@member) #朝食いいね
    @nices_lunch = Nice.where(ymd: @date,timeframe: "lunch",user_id:@member) #昼食いいね
    @nices_dinner = Nice.where(ymd: @date,timeframe: "dinner",user_id:@member) #夕食いいね
    @nices_snack = Nice.where(ymd: @date,timeframe: "snack",user_id:@member) #間食いいね
  end

  def edit
    @member= User.find(params[:id])
    unless @member == current_user
      redirect_to  edit_member_path(current_user)
    end
  end

  def update
   @member = User.find(params[:id])
   if @member.update(member_params)
   redirect_to root_path
   else
   render "index"
   end
  end

  private

  def member_params
    params.permit(:user, keys: [ :height, :weight, :purpose, :profile])
  end

end
