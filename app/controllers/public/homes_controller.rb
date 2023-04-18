class Public::HomesController < ApplicationController
  def top
    @user = User.new
  end

  #ゲストログイン
  def guest_sign_in

      #ゲスト用デフォルト値
      guest_name  = "ゲスト"
      guest_email = "guest@example.com"
      guest_height = 160
      guest_weight = 60
      guest_purpose = 3
      guest_profile = "ゲストユーザー用、体験アカウントです。"
      guest_status = false

      user = User.find_or_create_by!(email: guest_email) do |user|
      user.name = guest_name
      user.height = guest_height
      user.weight = guest_weight
      user.purpose = guest_purpose
      user.profile = guest_profile
      user.status = guest_status
      user.password = SecureRandom.urlsafe_base64
      end

    if user.persisted?
      user.update(name: guest_name, height: guest_height, weight: guest_weight, purpose: guest_purpose, profile: guest_profile, status: guest_status)
    end
      sign_in user
      redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
