class Admins::ChildrenController < ApplicationController
	before_action :authenticate_admin!

	def index
		@children = Children.all.page(params[:page])
	end
end
