class Admins::AdminsUsersController < ApplicationController
	before_action :authenticate_admin!

	def show
		@admin_user = Admin.find(params[:id])
	end

	def edit
		@admin_user = Admin.find(params[:id])
	end

	def update
		@admin_user = Admin.find(params[:id])
		if @admin_user.update(asmin_user_params)
      		flash[:success] = "更新に成功しました"
      		redirect_to admin_admins_user_path(@admin_user)
    	else
      		flash.now[:danger]="更新に失敗しました"
      		render "edit"
    	end
	end

	def destroy
		@admin_user = Admin.find(params[:id])
    	@admin_user.destroy
	end

	private

	def admin_user_params
		params.require(:admin_user).permit(:facility_name, :email)
	end

end
