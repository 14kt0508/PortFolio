class Users::ContactsController < ApplicationController

	def index
		@contacts = Contact.all
	end

	def show
		@contacts = Contact.find(params[:id])
	end

end
