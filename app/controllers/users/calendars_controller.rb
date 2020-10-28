class Users::CalendarsController < ApplicationController

	def index
		# @calrendars = Calendaer.all
		@events = Event.all
		respond_to do |format|
	    	format.html # index.html.erb
	    	format.xml { render :xml => @events }
      		format.json { render :json => @events }
      	end
	end
end
