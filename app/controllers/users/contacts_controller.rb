class Users::ContactsController < ApplicationController

    before_action :authenticate_user!

	def index
		@contacts = Contact.all.page(params[:page])
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
