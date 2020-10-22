class Admins::EventsController < ApplicationController
	before_action :authenticate_admin!

	def new
		@event = Event.new

	end

	def create
		@event = Item.new(item_params)
    	if @event.save
      		flash[:success] = "商品登録に成功しました"
      		redirect_to admin_calendars_path(@event)
    	else
      		flash.now[:danger]="商品登録に失敗しました"
      		render 'new'
    	end
	end

	def show
		@event = Event.find(params[:id])
	end

	def edit
		@event = Event.find(params[:id])
		if @event.update(event_params)
      		flash[:success] = "更新に成功しました"
      		redirect_to admin_calendars_path(@event)
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
    	redirect_to admin_calendars_path(@event)
	end

	private

	def event_params
		params.require(:event).permit(:time, :title, :body)


end
