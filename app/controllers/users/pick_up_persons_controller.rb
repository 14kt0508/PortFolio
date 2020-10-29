class Users::PickUpPersonsController < ApplicationController

	def new
		@pick_up_person = PicUpPerson.new
	end

	def create
		@pick_up_person = PicUpPerson.new(pick_up_persn_params)
		if @pick_up_person.save
	      flash[:success] = "登録に成功しました"
	      redirect_to users_path_path(@pick_up_person)
	    else
	      flash.now[:danger]="登録に失敗しました"
	      render 'new'
	    end

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

	def pick_up_person_params
		params.require(:pick_up_person).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :birth_date, :post_code, :address, :telephone, :relationship)
	end

end