class RegistrationsController < Devise::RegistrationsController
    before_action :authenticate_user!, :except => [:about, :landing]
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: ([:first_name, :last_name, :firm, :roles]))
    end
  
  end