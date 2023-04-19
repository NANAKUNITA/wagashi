class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
   def after_sign_in_path_for(resource)
      case resource
      when User
         root_path(current_user)
      when Admin
         root_path
      end
   end

   def after_sign_out_path_for(resource)
     root_path
   end

   add_flash_types :success, :info, :warning, :danger
  protected

  def configure_permitted_parameters
    #  byebug
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :email, :password])
  end
end
