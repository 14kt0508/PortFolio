class Users::EventsController < ApplicationController

	def index
		@events = Event.all
	end

	def show
		@event = Event.find(params[:id])
		@class_names = @event.class_names
	end

end
