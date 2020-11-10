class Admins::CalendarsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@events = Event.all
		respond_to do |format|
	    	format.html
      		format.xml { render :xml => @events }
      		format.json { render :json => @events }
      	end
	end
end
