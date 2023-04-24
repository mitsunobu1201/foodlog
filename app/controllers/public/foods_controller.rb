class Public::FoodsController < ApplicationController
  before_action :authenticate_user!

  def new
    @newfood = Food.new
  end

  def index
    @foods = Food.where(user_id: current_user.id)
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    if @food.save
      redirect_to foods_path
    else
      render :new
    end
  end

  def edit
    @food = Food.find(params[:id])
    unless current_user.id == @food.user_id
      redirect_to foods_path
    end
  end

  def update
    @food = Food.find(params[:id])
    if current_user.id == @food.user_id
    if @food.update(food_params)
      flash[:notice] =  "#{@food.name}の編集に成功しました。"
      redirect_to foods_path
    else
      render "edit",status: :unprocessable_entity
    end

    else
      redirect_to foods_path
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

  def food_params
    params.require(:food).permit(:name, :calorie, :protein, :fat, :carbohydrate, :explanation)
  end
end
