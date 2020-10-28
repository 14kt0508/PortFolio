class Users::PickUpPersonsController < ApplicationController

	def new
		@pick_up_person = PicUpPerson.new
	end

	def create
		@pick_up_person = PicUpPerson.new

	end

	def edit
		@pick_up_person = PicUpPerson.find(params[:id])
	end

	def update
		@pick_up_person = PicUpPerson.find(params[:id])
		if @cildren.update
	      flash[:success] = "情報が更新されました"
	      redirect_to users_path(@children)
	    else
	      flash.now[:danger]="更新に失敗しました"
	      render 'new'
	    end

	end

	def destroy
		@pick_up_person = PicUpPerson.find(params[:id])
		@pick_up_person.destroy
		flash[:success] = "情報が削除されました"
  		redirect_to users_path
	end

	def children_params
		params.require(:pick_up_person).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :birth_date, :post_code, :address, :telephone, :relationship)
	end

end