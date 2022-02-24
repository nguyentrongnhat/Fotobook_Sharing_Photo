class ApplicationController < ActionController::Base
	  before_action :configure_permitted_parameters, if: :devise_controller?

	  protected

	  def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :avatar])
	  end

	before_action :set_locale
		def set_locale
			I18n.locale = params[:locale] || I18n.default_locale
		end

	def check_login
		if !user_signed_in?
			redirect_to photos_feed_path
		end
	end

	def check_login_to_redirect_login
		if !user_signed_in?
			redirect_to new_user_session_path
		end
	end
end
