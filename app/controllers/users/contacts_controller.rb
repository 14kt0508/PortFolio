class Users::ContactsController < ApplicationController

	def index
		@contacts = Contact.all.page(params[:page])
	end

	def show
		@contact = Contact.find(params[:id])
	end

	private

	def contact_params
        params.require(:contact).permit(:title, :body, :image)
    end

end
