class Users::UsersController < ApplicationController

	before_action :authenticate_user!

	def show
		@user = current_user
		@children = @user.children
		@pick_up_persons = @user.pick_up_persons
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		if @user.update(user_params)
			flash[:change] = "会員情報を更新しました"
			redirect_to user_path
		else
			render :edit
		end

	end

	def destroy
		@user = current_user
		@user.destroy
		flash[:success] = "情報が削除されました"
  		redirect_to root_path
	end


	private

	def user_params
		 params.require(:user).permit(:first_name, :first_name_kana,:family_name,:family_name_kana,:post_code,:address,:telephone,:email)
	end


end
