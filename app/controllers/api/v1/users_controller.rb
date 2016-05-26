class Api::V1::UsersController < ApplicationController

	protect_from_forgery with: :null_session

	# list all users
	def index
		users = User.all
		response_api_include(:organizations,200,"success",users,nil)
	end

	# show a user
	def show
		begin
			user = User.find(params[:id])
			status = 200
			message = "success"
		rescue
			user = {}
			status = 404
			message = "not found"
		end	
		response_api_include(:organizations,status,message,user,nil)
	end	
	
	# store a user
	def create
		user = User.new
		user.name = params[:name]
		user.address = params[:address]
		user.email = params[:email]
		
		if user.save
			response_api_include(:organizations,200,"success",user,nil)
		else
			response_api_include(:organizations,403,"success",{},user.errors)
		end	
	end

	# update a user
	def update
		user = User.find(params[:id])
		user.name = params[:name]
		user.address = params[:address]
		user.email = params[:email]
		
		if user.save
			response_api_include(:organizations,200,"success",user,nil)
		else
			response_api_include(:organizations,403,"success",{},user.errors)	
		end	
	end

	# delete a user
	def destroy
		user = User.find(params[:id])
		user.delete
		response_api_include(:organizations,200,"success",{},nil)
	end

	# join a user to an organization
	def join

		#check if already joined
		user = User.find(params[:id])
		message = ""
		user.organizations.each do |org|
			if org.id.to_s == params[:organization_id].to_s
				message = "already joined"	
			end	
		end	

		if message != "already joined"
			uorg = UserOrganization.create({
				user_id: params[:id],
				organization_id: params[:organization_id]
			});

			# refresh user data to include joined organizations
			user = User.find(params[:id])

			if uorg.save
				response_api_include(:organizations,200,"success",user,nil)
			else
				response_api_include(:organizations,403,"success",{},user.errors)
			end
		else
			response_api_include(:organizations,403,"already joined",user,nil)
		end	
	end

	# leave a user from an organization 
	def leave
		if params[:organization_id] == ""
			response_api_include(:organizations,500,"bad request",{},[:organization_id => 'can\'t be blank'])
		else	
			uorg = UserOrganization.where("user_id = ? and organization_id = ?",params[:id],params[:organization_id]).first
			user = User.find(params[:id])
			if uorg.nil?
				response_api_include(:organizations,403,"already leave",user,nil)
			else
				uorg.delete
				response_api_include(:organizations,200,"success",user,nil)
			end
		end
	end	

end
