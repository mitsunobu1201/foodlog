class Admin::NicesController < ApplicationController
before_action :authenticate_admin!

  def index
    @nices = Nice.all
  end

  def destroy
    @nice = Nice.find(params[:id])
    @nice.destroy
    redirect_to admin_nice_path
  end

end
