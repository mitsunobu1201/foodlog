class Admin::FoodsController < ApplicationController

before_action :authenticate_admin!

  def index
    @foods = Food.all
  end

  def show

    @food = Food.find(params[:id])

  end

  def update
    @food = Food.find(params[:id])
   if @food.update(food_params)
    redirect_to admin_foods_path
   else
    render "show",status: :unprocessable_entity
   end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to admin_foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :calorie, :protein, :fat, :carbohydrate, :explanation)
  end
end
