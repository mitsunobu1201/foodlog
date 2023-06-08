class Public::FoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_food, only: [:edit, :update]
  before_action :check_user_id, only: [:edit, :update]

  def new
    @food = Food.new
  end

  def index
    @foods = Food.where(user_id: current_user.id)
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    if @food.save
      flash[:notice] =  "#{@food.name}の登録に成功しました。"
      redirect_to foods_path
    else
      render :new,status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @food.update(food_params)
      flash[:notice] =  "#{@food.name}の編集に成功しました。"
      redirect_to foods_path
    else
      render "edit",status: :unprocessable_entity
    end
  end


  def destroy
    @food = Food.find(params[:id])
    if current_user.id == @food.user_id

    @food.destroy
    flash[:notice] =  "#{@food.name}の削除に成功しました。"
    redirect_to foods_path
    else
    flash[:alert] =  "#{@food.name}の削除に失敗しました。"
    redirect_to foods_path
    end
  end


  private

  #パラメーターを変数にセット
  def set_food
    @food = Food.find(params[:id])
  end

  #カレントユーザーかチェック
  def check_user_id
    redirect_to foods_path unless current_user.id == @food.user_id
  end


  def food_params
    params.require(:food).permit(:name, :calorie, :protein, :fat, :carbohydrate, :explanation)
  end
end
