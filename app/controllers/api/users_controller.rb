class Api::UsersController < ApplicationController
	def sign_in
    @user = User.where(email: params[:email]).first
    if @user.blank?
      render text: 'Invalid username', status: 401
    elsif @user.valid_password?(params[:password])
      render json: { email: @user.email, authentication_token: @user.authentication_token }
    else
      @user = nil
      render text: 'Invalid password', status: 401
    end
  end

  def sign_out
    current_user.reset_authentication_token!
    head :ok
  end
end
