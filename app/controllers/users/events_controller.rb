class Users::EventsController < ApplicationController

	before_action :authenticate_user!

	def index
		@events = Event.all
	end

	def show
		@event = Event.find(params[:id])
		@class_names = @event.class_names
	end

end
