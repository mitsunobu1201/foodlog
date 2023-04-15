class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      admin_root_path
    else
      member_path(current_user.id, year: Time.zone.now.year, month: Time.zone.now.month, day: Time.zone.now.day)
    end
  end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin_user
      new_admin_admin_user_session_path
    else
      root_path
    end
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :height, :weight, :purpose, :profile])
  end

end
