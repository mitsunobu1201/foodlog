class Public::MembersController < ApplicationController
  def index
    @members = User.all
  end

  def show
    @member = User.find(params[:member])
    @current_member = current_user
    @meals = Meal.all

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
  end
end
