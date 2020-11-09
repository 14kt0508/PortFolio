class Users::ChildrenController < ApplicationController

	def new
		@children = Child.new
	end

	def create
		@children = Child.new(children_params)
		@children.user_id = current_user.id
	    if @children.save
	      flash[:success] = "登録に成功しました"
	      redirect_to user_path(@children)
	    else
	      flash.now[:danger]="登録に失敗しました"
	      render 'new'
	    end

	end

	def edit
		@children = Child.find(params[:id])
	end

	def update
		@children = Child.find(params[:id])
	    if @children.update(pick_up_person_params)
	      flash[:success] = "情報が更新されました"
	      redirect_to user_path_path(@children)
	    else
	      flash.now[:danger]="更新に失敗しました"
	      render 'new'
	    end
	end

	def destroy
		@children = Child.all
		@children = Child.find(params[:id])
		@children = destroy
		flash[:success] = "情報が削除されました"
  		redirect_to user_path
	end

	private

	def children_params
		params.require(:child).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :birth_date, :class_name_id, :pick_up_person, :pick_up_time, :allergies, :remarks)
	end

end
