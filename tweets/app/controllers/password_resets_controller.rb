class PasswordResetsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      #* send an email
      #* deliver_later is for show a response to user ASAP and send an email whenever everything was ready (connection stuff)
      PasswordMailer.with(user: @user).reset.deliver_later

      redirect_to sign_in_path, notice: 'An email sent to your email address'
    else
      flash.now.alert = 'User not found.'
      render :new
    end
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, alert: 'Your token has expired. Please try again.'
  end

  def update
    @user = User.find_signed!(params[:token], purpose: 'password_reset')

    if @user.update(password_params)
      redirect_to sign_in_path,
                  notice:
                    'Your password was reset successfully. Now you can sign in.'
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
