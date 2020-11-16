class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :except => [:about, :landing]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :firm])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :firm])
  end

  def authenticate_admin!
    authenticate_user!
    redirect_to root_path, status: :forbidden unless current_user.admin?
  end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def after_sign_in_path_for(resource_or_scope)
    welcome_path
  end
end
