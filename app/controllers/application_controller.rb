class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後のリダイレクト先
def after_sign_in_path_for(resource_or_scope)
  case resource_or_scope

  when Admin
    admin_root_path

  when User
    #会員ステータスが有効かチェック
    unless current_user.status == true
      member_path(current_user.id, year: Time.zone.now.year, month: Time.zone.now.month, day: Time.zone.now.day)
    else
      sign_out(current_user)
      flash[:alert] =  "退会済みであるためログインできません。"
      root_path

    end
  end
end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :height, :weight, :purpose, :profile,:sex,:activity,:birthday])
  end

end
