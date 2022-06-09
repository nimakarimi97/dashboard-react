class SessionsController < ApplicationController
  def destroy
    #* so the dashboard_controller find_by action will be failed to find the user_id
    session[:user_id] = nil

    redirect_to sign_in_path, notice: 'Logged out'
  end

  def new
    if Current.user
      redirect_to dashboard_path, notice: 'You are already logged in.'
    end
  end

  def create
    user = User.find_by(email: params[:email])

    if user.present? && params[:email] != '' &&
         user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path, notice: 'Logged in successfully'
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end
end
