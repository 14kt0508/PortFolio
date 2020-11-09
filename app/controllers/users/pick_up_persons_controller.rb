class Users::PickUpPersonsController < ApplicationController

	def new
		@pick_up_person = PickUpPerson.new
	end

	def create
		@pick_up_person = PickUpPerson.new(pick_up_person_params)
		@pick_up_person.user_id = current_user.id
		if @pick_up_person.save(pick_up_person_params)
	      flash[:success] = "登録に成功しました"
	      redirect_to user_path(current_user)
	    else
	      flash.now[:danger]="登録に失敗しました"
	      render 'new'
	    end

	end

	def edit
		@pick_up_person = PickUpPerson.find(params[:id])
	end

	def update
		@pick_up_person = PickUpPerson.find(params[:id])
		if @pick_up_person.update(pick_up_person_params)
	      flash[:success] = "情報が更新されました"
	      redirect_to user_path(@pick_up_person)
	    else
	      flash.now[:danger]="更新に失敗しました"
	      render 'new'
	    end

	end

	def destroy
		@pick_up_person = PickUpPerson.find(params[:id])
		@pick_up_person.destroy
		flash[:success] = "情報が削除されました"
  		redirect_to user_path
	end

	private

	def pick_up_person_params
		params.require(:pick_up_person).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :birth_date, :post_code, :address, :telephone, :relationship)
	end

end