class EventsController < ApplicationController

  before_action :authenticate_user!, only: [:new ,:create, :destroy, :udpate]
  before_action :owner, only:[:update, :destroy, :edit]
  before_action :under_validation,  only:[:show]

  def show
   @event=Event.find(params[:id])
   @attendees=@event.attendances.count
   @user=current_user
  end

  def index
    @events_validated=Event.where(validated:true).order('created_at ASC')
   
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
   
  e=Event.create(start_date: @start_date, duration: @duration, title: @title, description: @description, price: @price, location: @location, admin: @admin, validated: nil)
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
     @event=Event.find(params[:id])
     @event.destroy
     flash[:success] = "Event has been deleted"
     redirect_to events_path
  end

 def edit
     @event=Event.find(params[:id])
  end


  def update
    @event=Event.find(params[:id])
    title=params[:event][:title]
    description=params[:event][:description]
    location=params[:event][:location]
    duration = params[:event][:duration].to_i
    price=params[:event][:price].to_i
    start_date=params[:event][:start_date]
    admin=current_user
    validated=@event.validated
    @event.illustration.attach(params[:illustration])
    @event.update(title:title, description:description,location:location, duration:duration, price:price, start_date:start_date, admin:admin, validate:validate)
    puts @event.errors.messages

     if @event.save
     flash[:success] = "Event has been successfully created"
      redirect_to event_path(@event)

    else
     flash[:danger] = "Oups, something went wrong"
      redirect_to edit_event_path(@event)
    end
  end


private

  def owner
    @event=Event.find(params[:id])
     if current_user != @event.admin
       flash[:danger] = "The page you're trying to reach is not yours"    
       redirect_to events_path
    end
  end 

 
 def under_validation 
  puts @event=Event.find(params[:id])
  if current_user == @event.admin
      redirect_to events_path(@event)   
  else
    if @event.validated == nil || @event.validated == false
       flash[:danger] = "This event is not validated yet"    
      redirect_to events_path
    end

  end

  
end

end
