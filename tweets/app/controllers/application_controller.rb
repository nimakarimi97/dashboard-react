class ApplicationController < ActionController::Base
  #? before running any actions set current user
  before_action :set_current_user

  def set_current_user
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
