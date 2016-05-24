class Api::V1::OrganizationsController < ApplicationController

	protect_from_forgery with: :null_session

	# list all organizations
	def index
		org = Organization.all
		render :json => org.to_json(:include => :users)
	end

	# show an organization
	def show
		begin
			org = Organization.find(params[:id])
		rescue
			org = {}
		end	
		render :json => org.to_json(:include => :users)
	end	
	
	# store an organization
	def create
		org = Organization.new
		org.name = params[:name]
		
		if org.save
			render :json => org.to_json(:include => :users)
		else
			render :json => org.errors.to_json	
		end	
	end

	# update an organization
	def update
		org = Organization.find(params[:id])
		org.name = params[:name]
		
		if org.save
			render :json => org.to_json(:include => :users)
		else
			render :json => org.errors.to_json	
		end	
	end

	# delete an organization
	def destroy
		org = Organization.find(params[:id])
		org.delete
		render :json => {}.to_json
	end

	# list all members
	def members
		org = Organization.find(params[:id])
		render :json => org.users.to_json
	end	

end
