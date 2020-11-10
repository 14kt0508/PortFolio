class Users::UsersController < ApplicationController

	def index
		@users =User.all
		@children = Child.all
		@pick_up_person = Pick_up_person.all
	end

	def show
		@user = User.find(params[:id])
		@children = @user.children
		@pick_up_persons = @user.pick_up_persons
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:change] = "会員情報を更新しました"
			redirect_to user_path
		else
			render :edit
		end

	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		flash[:success] = "情報が削除されました"
  		redirect_to root_path
	end


	private

	def user_params
		 params.require(:user).permit(:first_name, :first_name_kana,:family_name,:family_name_kana,:post_code,:address,:telephone,:email)
	end


end
