class EventsController < ApplicationController

  before_action :authenticate_user!, only: [:new ,:create, :destroy, :udpate]

  def show
   @event=Event.find(params[:id])
   @attendees=@event.attendances.count
   puts @attendees
  end

  def index
    @events=Event.all
  end




  def new
  end

  def create
  
    #Les strings
     puts @title=params[:event][:title]
     puts @description=params[:event][:description]
     puts @location=params[:event][:location]


    #La date à recomposer à partir de 6 informations
        puts year=params[:user][:born_on][0,4].to_i
        puts month=params[:user][:born_on][5,2].to_i
        puts day=params[:user][:born_on][8,2].to_i
        puts hour=params[:task][:started_at][0,2].to_i
        puts minute=params[:task][:started_at][3,2].to_i
        puts seconde=0

    puts @start_date = DateTime.new(year,month,day,hour,minute,seconde)


    #Les integers
    puts @duration = params[:duration][:price].to_i
    puts @price=params[:price][:price].to_i
    
    #l'admin
    puts @admin=current_user
   
  e=Event.create(start_date: @start_date, duration: @duration, title: @title, description: @description, price: @price, location: @location, admin: @admin)
  puts e.errors.messages

    if e.save
     flash[:success] = "Event has been successfully created"
      redirect_to event_path(e)

    else
     flash[:danger] = "Oups, something went wrong"
      redirect_to new_event_path
    end


  end

  def destroy
  end

  def update
  end

  
end
