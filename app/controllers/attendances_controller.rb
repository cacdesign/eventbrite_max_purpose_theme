class AttendancesController < ApplicationController


  def new
   @event=Event.find(params[:event_id])  
  
  end

  def index
  @attendances=Attendance.all

  end

  
  def create
  # Amount in cents
  @event=Event.find(params[:event_id])  
  @user=current_user
  @amount = @event.price

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

  a=Attendance.create(event: @event, user:@user, stripe_customer_id: params[:stripeToken])
  puts a.errors.messages

  if a.save 
    flash[:success] = "Your participation has been validated"
    redirect_to event_path(@event)
  end

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_attendance_path(@event)
end


  

  def destroy
  end

  def show
  end

  def update
  end



end
