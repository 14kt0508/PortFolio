class Admins::UsersController < ApplicationController
	before_action :authenticate_admin!

	def index
		@users = User.find(params[:id])
	end

	def show
		@user = User.find(params[:id])
	end


  private

	def userr_params
		params.require(:user).permit()
	end


end
