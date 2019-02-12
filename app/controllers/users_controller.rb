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
		puts '$'*30
		puts params[:user][:first_name]
		puts params[:user][:last_name]
		puts params[:user][:description]


		User.update(first_name:params[:user][:first_name], last_name:params[:user][:last_name], description:params[:user][:description])
		if User.update
			flash[:success] = "Profile has been updated"
		else
			flash[:danger] = "Oups, something went wrong"
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
