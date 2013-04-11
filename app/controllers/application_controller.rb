class ApplicationController < ActionController::Base
  protect_from_forgery
  def get_user
	  if params[:user_id]
	  	@user = User.find_by_displayname(params[:user_id])
	  end
	end
end
