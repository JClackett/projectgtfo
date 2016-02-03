class ApplicationController < ActionController::Base

	# ---------------------------------------------------------------------------------------------------------------------------------------------------------------
	# Callbacks  
	# ---------------------------------------------------------------------------------------------------------------------------------------------------------------

		# Prevent CSRF attacks by raising an exception.
		# For APIs, you may want to use :null_session instead.
		protect_from_forgery with: :exception
		before_action :configure_devise_permitted_parameters, if: :devise_controller?
		before_action :sidebar_tags

	# ---------------------------------------------------------------------------------------------------------------------------------------------------------------
	#  Rescue
	# ---------------------------------------------------------------------------------------------------------------------------------------------------------------
	 
		rescue_from CanCan::AccessDenied do |exception|

			redirect_to root_url, :alert => "Access Denied"
			
		end

	# ---------------------------------------------------------------------------------------------------------------------------------------------------------------
	# Methods 
	# ---------------------------------------------------------------------------------------------------------------------------------------------------------------
		def sidebar_tags 
			@tags=Tag.all
		end 

		def story
		end

		def contact
		end

		def about
		end
		

		def configure_devise_permitted_parameters
			registration_params = [:first_name, :last_name, :email, :password, :password_confirmation]

			if params[:action] == 'update'
				devise_parameter_sanitizer.for(:account_update) { 
				|u| u.permit(registration_params << :current_password)
				}
			elsif params[:action] == 'create'
				devise_parameter_sanitizer.for(:sign_up) { 
				|u| u.permit(registration_params) 
				}
			end
		end

end
