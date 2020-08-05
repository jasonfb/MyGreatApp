class Dashboard::EventsController < ApplicationController

  before_action :authenticate_user!



  before_action :load_event, only: [:show, :edit, :update, :destroy]


  

  def load_event
    @event = current_user.events.find(params[:id])
  end

  def index
    @events = current_user.events.page(params[:page])

    respond_to do |format|
      format.js
      format.html {render 'all.haml'}
    end
  end

  def new
    @event = Event.new(user: current_user)
    respond_to do |format|
      format.js
    end
  end

  def create
    @event = Event.create(event_params.merge!(user: current_user))
    respond_to do |format|
      if @event.save
        format.js
      else
        flash[:alert] = "Oops, your event could not be saved."
        format.js
      end
    end
  end

  def show
    respond_to do |format|
      format.html
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if !@event.update(event_params)
        flash[:alert] = "Event could not be saved"
      end
      format.js {}
    end
  end

  def destroy
    respond_to do |format|
      begin
        @event.destroy
      rescue StandardError => e
        flash[:alert] = "Event could not be deleted"
      end
      format.js {}
    end
  end

  def event_params
    params.require(:event).permit( [:user_id, :name, :start_at, :end_at, :promote_on,
                                    :description] )
  end

  def default_colspan
    6
  end

  def namespace
    
      "dashboard/"
    
  end


  def common_scope
    @nested_args
  end

end


