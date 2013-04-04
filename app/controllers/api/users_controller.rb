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

  def change_pass
    @user = User.where(email: params[:email]).first
    if @user
      if @user.valid_password?(params[:cur_pas])
        @user.password = params[:new_pas]
        @user.save
        render json:{ status: "ok", message: "Thay doi mat khau thanh cong!"}
      else
        render json: { status: "fail", message: "Mat khau cu khong dung!"}
      end
    else
      render json: {status: "fail", message: "Nguoi dung khong ton tai"}
    end
  end
end
