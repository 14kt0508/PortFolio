class Admins::ChildrenController < ApplicationController
	before_action :authenticate_admin!

	def index
		@children = Child.all.page(params[:page])
	end

	def search
		# @children = Child.all

		# @class_names = ClassName.find(params[:id])
		if params[:name][:content] == "全クラス"
			redirect_to  admins_children_path
		else
    		@records = ClassName.where(name: params[:name][:content])
		end
	end


	private

	# def search_for(model, content, method)
	#     if model == 'user'
	#     	if method == 'perfect'
	#         	ClassName.where(name: content)
	#       	elsif method == 'forward'
	#         	ClassName.where('name LIKE ?', content+'%')
	#       	elsif method == 'backward'
	#         	ClassName.where('name LIKE ?', '%'+content)
	#       	else
	#         	ClassName.where('name LIKE ?', '%'+content+'%')
	#       	end
	#     end
 #    end

	def children_params
		params.require(:child).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :birth_date, :class_name, :pick_up_person, :pick_up_time, :allergies, :remarks)
	end

end
