class Admins::UsersController < ApplicationController
	before_action :authenticate_admin!

	def index
		@users = User.all.page(params[:page])
	end

	def show
		@user = User.find(params[:id])
	end


  private

	def user_params
		params.require(:user).permit(:first_name, :first_name_kana,:family_name,:family_name_kana,:post_code,:address,:telephone,:email)
	end


end
