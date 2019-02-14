class IllustrationsController < ApplicationController
  def create
  	@event = Event.find(params[:event_id])
    @event.illustration.attach(params[:illustration])
    redirect_to(event_path(@event))
  end
end
