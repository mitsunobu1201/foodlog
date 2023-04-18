class Public::HomesController < ApplicationController
  def top
    @user = User.new
  end

  #ゲストログイン
  def guest_sign_in

      #ゲスト用デフォルト値
      guest_name  = "ゲスト"
      guest_email = "guest@example.com"
      guest_height = "160"
      guest_weight = "60"
      guest_purpose = "etc"
      guest_profile = "ゲストユーザー用、体験アカウントです。"
      guest_status = "false"

      #ゲストユーザー用アカウント生成
      user = User.find_or_create_by!(email:guest_email,name:guest_name,height:guest_height,weight:guest_weight,purpose:guest_purpose,profile:guest_profile,status:guest_status,) do |user|

      #ゲストユーザーはランダムなパスワードを生成
      user.password = SecureRandom.urlsafe_base64

    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
