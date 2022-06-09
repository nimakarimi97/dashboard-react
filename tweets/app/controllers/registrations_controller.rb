class RegistrationsController < ApplicationController
  def new
    @user = User.new

    if Current.user
      redirect_to dashboard_path, notice: 'You have already registered.'
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path, notice: 'Account created successfully.'
    else
      render :new
      # render :new, status: :unprocessable_entity # if the error is not shown
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
