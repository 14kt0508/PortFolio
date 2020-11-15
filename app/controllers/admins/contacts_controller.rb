class Admins::ContactsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@contacts = Contact.all.page(params[:page])
	end

	def new
		@contact = Contact.new
		@class_names = ClassName.all
        @users = User.all
	end

	def confirm
		@contact = Contact.new(contact_params)
        @contact.admin_id = current_admin.id
        @user_ids = params[:contact_to][:user_ids]
        @class_name_ids = params[:contact_to][:class_name_ids]
        @image_path = contact_params[:image]
		render :new if @contact.invalid?
	end

	def create
		@contact = Contact.new(contact_params)
        @contact.admin_id = current_admin.id
		if @contact.save
            params[:class_name_id].split(' ').map{|class_name_id|
                ContactTo.create(contact_id:@contact.id,class_name_id:class_name_id)
            }
            params[:user_id].split(' ').map{|user_id|
                ContactTo.create(contact_id:@contact.id,user_id:user_id)
            }

      		flash[:success] = "送信に成功しました"
      		redirect_to admins_contacts_path
    	else
      		flash.now[:danger]="送信に失敗しました"
	      	render 'new'
    	end
    end

    def show
        @contact = Contact.find(params[:id])
        contact_tos = @contact.contact_tos
        @class_names = []
        contact_tos.each do |contact_to|
            @class_names.push(contact_to.class_name)
        end
    end

    private

    def contact_params
        params.require(:contact).permit(:title, :body, :image)
    end

end
