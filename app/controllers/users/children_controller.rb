class Users::ChildrenController < ApplicationController

	def new
		@children = Children.new
	end

	def create
		@children = Children.new(children_params)
	    if @cildren.save
	      flash[:success] = "登録に成功しました"
	      redirect_to users_path_path(@children)
	    else
	      flash.now[:danger]="登録に失敗しました"
	      render 'new'
	    end

	end

	def edit
		@children = Children.find(params[:id])
	end

	def update
		@children = Children.find(params[:id])
	    if @cildren.update
	      flash[:success] = "情報が更新されました"
	      redirect_to users_path_path(@children)
	    else
	      flash.now[:danger]="更新に失敗しました"
	      render 'new'
	    end
	end

	def destroy
		@children = Children.all
		@children = Children.find(params[:id])
		@children = destroy
		flash[:success] = "情報が削除されました"
  		redirect_to users_path
	end

	private

	def children_params
		params.require(:children).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :birth_date, :class_name, :pick_up_person, :pick_up_time, :allergies, :remarks)
	end

end
