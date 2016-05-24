class Api::V1::OrganizationsController < ApplicationController

	protect_from_forgery with: :null_session

	# list all organizations
	def index
		org = Organization.all
		response_api_include(:users,200,"success",org,nil)
	end

	# show an organization
	def show
		begin
			org = Organization.find(params[:id])
		rescue
			org = {}
		end	
		response_api_include(:users,200,"success",org,nil)
	end	
	
	# store an organization
	def create
		org = Organization.new
		org.name = params[:name]
		
		if org.save
			response_api_include(:users,200,"success",org,nil)
		else
			response_api_include(:users,200,"success",{},org.errors)	
		end	
	end

	# update an organization
	def update
		org = Organization.find(params[:id])
		org.name = params[:name]
		
		if org.save
			response_api_include(:users,200,"success",org,nil)
		else
			response_api_include(:users,200,"success",{},org.errors)	
		end	
	end

	# delete an organization
	def destroy
		org = Organization.find(params[:id])
		org.delete
		response_api_include(:users,200,"success",{},nil)
	end

end
