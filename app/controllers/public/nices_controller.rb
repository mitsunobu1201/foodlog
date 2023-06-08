class Public::NicesController < ApplicationController
  before_action :authenticate_user!
  def index
   @nices = Nice.where(nice_user_id: current_user.id)
  end

  def create
    @nice = Nice.new(nice_params)
    if @nice.save
    redirect_to request.referer
     end
  end

  def destroy
    nice = Nice.find_by(ymd: params[:ymd], timeframe: params[:timeframe], user_id: params[:user_id], nice_user_id: current_user.id)

    if current_user.id == nice.user_id
      nice.destroy
      redirect_to request.referer
    else
      render 'index'
    end
  end


private

  def nice_params
    params.permit(:ymd, :timeframe, :user_id,:_method).merge(nice_user_id: current_user.id)
  end

end
