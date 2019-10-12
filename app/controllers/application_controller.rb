class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters ,if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

  def after_sign_out_path_for (resouces)
    new_user_session_path
  end

  def his_wordbook?
    redirect_to root_path unless current_user.id == @wordbook.user.id
  end
end
