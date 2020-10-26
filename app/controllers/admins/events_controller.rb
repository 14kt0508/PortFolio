class Admins::EventsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@events = Event.all
	end

	def new
		@event = Event.new
		@class_names = ClassName.all
	end

	def create
		@event = Event.new(event_params)
    	if @event.save
      		flash[:success] = "登録に成功しました"
      		redirect_to admins_calendars_path(@event)
    	else
      		flash.now[:danger]="登録に失敗しました"
      		render 'new'
    	end
	end

	def show
		@event = Event.find(params[:id])
		@class_names = ClassName.all
		params[:event][:neme] ? @class_name = params[:event][:name].join(",") : false
	end

	def edit
		@event = Event.find(params[:id])
		@class_names = ClassName.all
		if @event.update(event_params)
      		flash[:success] = "更新に成功しました"
      		redirect_to admis_calendars_path(@event)
    	else
      		flash.now[:danger]="更新に失敗しました"
      		render "edit"
    	end
	end

	def update
		@event = Event.find(params[:id])
	end

	def destroy
		@event = Event.find(params[:id])
    	@event.destroy
    	redirect_to admins_calendars_path(@event)
	end

	private

	def event_params
		params.require(:event).permit(:time, :title, :body)
		params.require(:class).permit(:name)
	end


end
