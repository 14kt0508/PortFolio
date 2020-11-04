class Admins::AdminsController < ApplicationController

	before_action :authenticate_admin!

	def show
		@admin = Admin.find(params[:id])
		@children = Child.all
		@pick_up_person = PickUpPerson.all
	end

	def edit
		@admin = Admin.find(params[:id])
	end

	def update
		@admin = Admin.find(params[:id])
		if @admin.update(admin_user_params)
      		flash[:success] = "更新に成功しました"
      		redirect_to admins_admin_path(@admin_user)
    	else
      		flash.now[:danger]="更新に失敗しました"
      		render "edit"
    	end
	end

	def destroy
		@admin = Admin.find(params[:id])
    	@admin.destroy
	end

	private

	def admin_params
		params.require(:admin).permit(:facility_id, :family_name, :family_name_kana, :first_name, :first_name_kana, :email)
	end

end
