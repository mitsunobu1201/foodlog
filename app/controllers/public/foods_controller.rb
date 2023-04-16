class Public::FoodsController < ApplicationController
  before_action :authenticate_user!
  def new
    @newfood = Food.new

  end

  def index
    @foods = Food.all
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    if @food.save
    redirect_to foods_path
    else
    redirect_to new_food_path
    end

  end

  def edit

    @food = Food.find(params[:id])

  end

  def update
   @food = Food.find(params[:id])
   if @food.update(food_params)
   redirect_to foods_path
   else
   render "index"
   end
  end

 def destroy
  @food = Food.find(params[:id])
  @food.destroy
  redirect_to foods_path
 end



  private

def food_params
  params.require(:food).permit(:name, :calorie, :protein, :fat, :carbohydrate, :explanation)
end

end
