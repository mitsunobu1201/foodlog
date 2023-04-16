class Admin::MembersController < ApplicationController
  def index
    @members = User.all
  end

  def show
    @member = User.find(params[:id])
  end

  def update
    @member = User.find(params[:id])
   if @member.update(member_params)
       redirect_to admin_members_path
     else
       render "index"
     end
  end

  private


def member_params
  params.require(:user).permit(:name, :height, :weight, :purpose, :profile, :status)
end


end