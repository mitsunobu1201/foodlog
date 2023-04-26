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
      guest_sex = "men"
      guest_activity = "sedentary"
      guest_birthday = Date.new(2000, 1, 1)
      guest_purpose = 3
      guest_profile = "ゲストユーザー用の体験アカウントです。"
      guest_status = false

      #ゲストアカウントが存在しない場合は作成
      user = User.find_or_create_by!(email: guest_email) do |user|
      user.name = guest_name
      user.height = guest_height
      user.weight = guest_weight
      user.activity = guest_activity
      user.sex = guest_sex
      user.birthday = guest_birthday
      user.purpose = guest_purpose
      user.profile = guest_profile
      user.status = guest_status
      user.password = SecureRandom.urlsafe_base64
      end

      sign_in user

      #サインインしたタイミングで登録情報をデフォルトに戻す
      if user.persisted?
        user.update(name: guest_name, height: guest_height, weight: guest_weight,activity: guest_activity,sex: guest_sex,birthday: guest_birthday,purpose: guest_purpose, profile: guest_profile)
      end

       guser = User.find_by(email: 'guest@example.com')
      if guser.status == true
        flash[:alert] =  "現在ゲスト機能は利用できません。"
        sign_out(current_user)
        redirect_to root_path
      else
        redirect_to root_path
    end
  end
end