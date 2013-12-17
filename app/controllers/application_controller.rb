class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

    # devise version of strong parameters
    # note: only three (devise) actions require parameters from the scary internet
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u| 
        u.permit :name, :email, :password, :password_confirmation
      end
      devise_parameter_sanitizer.for(:sign_in) do |u| 
        u.permit :email, :password, :password_confirmation
      end
      devise_parameter_sanitizer.for(:account_update) do |u| 
        u.permit :name, :email, :description, :password, :password_confirmation, :current_password
      end
    end
end
