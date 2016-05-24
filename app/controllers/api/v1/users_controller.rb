class Api::V1::UsersController < ApplicationController

	protect_from_forgery with: :null_session

	# list all users
	def index
		users = User.all
		render :json => users.to_json
	end

	# show a user
	def show
		begin
			user = User.find(params[:id])
		rescue
			user = {}
		end	
		render :json => user.to_json
	end	
	
	# store a user
	def create
		user = User.new
		user.name = params[:name]
		user.address = params[:address]
		user.email = params[:email]
		
		if user.save
			render :json => user.to_json
		else
			render :json => user.errors.to_json	
		end	
	end

	# update a user
	def update
		user = User.find(params[:id])
		user.name = params[:name]
		user.address = params[:address]
		user.email = params[:email]
		
		if user.save
			render :json => user.to_json
		else
			render :json => user.errors.to_json	
		end	
	end

	# delete a user
	def destroy
		user = User.find(params[:id])
		user.delete
		render :json => {}.to_json
	end

	# join a user to an organization
	def join	
	end

	# leave a user from an organization 
	def leave
	end	

end
