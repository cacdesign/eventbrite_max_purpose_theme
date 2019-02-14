class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show, :edit ]
	before_action :owner, only: [:show, :edit]

	def show
		@user=current_user
		@events=@user.organised_events
	end

	def edit
		@user=current_user
	end

	def update
		@user=current_user
	
		puts first_name = params[:user][:first_name]
		puts last_name = params[:user][:last_name]
		puts description =  params[:user][:description]

		 @user.update(first_name: first_name, last_name: last_name,  description: description)
		user.avatar.attach(params[:avatar])


		if @user.save
			flash[:success] = "Profile has been updated"
			redirect_to user_path(@user)
		else
			flash[:danger] = "Oups, something went wrong"
			edit_user_path(@user)
		end

	end
  

private

	def owner
		 if current_user != User.find(params[:id])
  		 flash[:danger] = "The profile page you're trying to reach is not yours"    
  		 redirect_to events_path
		end
	end	
end
