class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?



protected

def configure_permitted_parameters
	devise_parameter_sanitizer.permit(:sign_up, keys:[:last_name, :first_name, :kana_last_name, :kana_first_name, :post_code, :address, :phone_number])
end

def after_sign_in_path_for(resource)
	case resource
    when EndUser
         end_users_mypage_path
    when Admin
	     admin_top_path
    end
 end

end
