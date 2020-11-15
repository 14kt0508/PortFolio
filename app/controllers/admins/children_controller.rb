class Admins::ChildrenController < ApplicationController
	before_action :authenticate_admin!

	def index
		@children = Child.all.page(params[:page])
	end

	def search
		if params[:name][:content] == "全クラス"
			redirect_to  admins_children_path
		else
    		@records = ClassName.where(name: params[:name][:content])
		end
	end


	private

	def children_params
		params.require(:child).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :birth_date, :class_name, :pick_up_person, :pick_up_time, :allergies, :remarks)
	end

end
