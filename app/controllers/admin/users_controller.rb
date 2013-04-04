class Admin::UsersController < ApplicationController
	def index
		@users = User.all
	end

  def destroy

    @user = User.find(params[:id]) 
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_users_url }
      format.json { head :no_content }
    end

  end

  def new
  end


end
