class ApplicationController < ActionController::Base
	layout :layout_by_resource
	  include Pundit
  	protect_from_forgery

  	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	private

	#pundit method for non authorized users
	def user_not_authorized
    flash[:alert] = "Você não tem autorização para fazer isso!"
    redirect_to(request.referrer || root_path)
  end

	# Layout per resource_name
	def layout_by_resource
	  if devise_controller? && resource_name == :admin
	    "backoffice_devise"
	  else
	    "application"
	  end
	end
end
