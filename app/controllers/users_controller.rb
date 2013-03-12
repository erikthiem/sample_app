class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

  def new
		@user = User.new
  end

	def create
		@user = User.new(params[:user])
		if @user.save
			# Welcome message
			first_name_capitalized = @user.name.split(" ")[0].capitalize
			message = "Welcome to the sample app, " + first_name_capitalized + "."	
			message += " Thank you for making an account."

			flash[:success] = message
			redirect_to @user
		else
			render 'new'
		end
	end
end
