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
   render "index"
   end
  end

 def destroy
  @food = Food.find(params[:id])
  @food.destroy
  redirect_to foods_path
 end

end
