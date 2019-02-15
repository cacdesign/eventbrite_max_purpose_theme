class EventSubmissionsController < ApplicationController
  def index
  	@events=Event.all
  end

  def show
  end

  def edit
  end

  def update
	event=Event.find(params[:id])
	if event.validated == nil || event.validated == false 
		event.update(validated: true)
		 flash[:success] = "Event has been validated"
	else
		event.update(validated: false)
		 flash[:danger] = "Event has been unvalidated"
	end


	redirect_to event_submissions_path


  end
end
