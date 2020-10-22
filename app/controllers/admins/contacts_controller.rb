class Admins::ContactsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@contacts = Contact.all.page(params[:page])
	end

	def new
		@contact = Contact.new
	end

	def confirm
		@contact = Contact.new(contact_params)
		render :new if @contact.invalid?
	end

	def create
		@contact = Contact.new(contact_params)
		if @contact.save
      		flash[:success] = "商品登録に成功しました"
      		redirect_to admin_contacts_path(@item)
    	else
      		flash.now[:danger]="商品登録に失敗しました"
	      	render 'new'
    end

end
