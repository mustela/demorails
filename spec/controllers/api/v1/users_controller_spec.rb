require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
	describe 'GET #index' do
		it 'list all users in json' do
			FactoryGirl.create_list(:user,10)

			get :index
			json = JSON.parse(response.body)

			expect(response).to be_success
			expect(json['data'].length).to eq(10)
		end
	end

	describe 'GET #show' do
		let(:user) { create(:user) }

		it 'list an user in json' do
			FactoryGirl.create(:user)

			get :show , id: user
			parsed_response = JSON.parse(response.body)
      		expect(parsed_response['data']).to_not be_nil
		end
	end

	describe 'POST #create' do
		context 'with valid params' do
			it 'return the created user' do
				post :create, { name: 'John Doe',address: 'Balikpapan',email: 'john.doe@mail.me'}
				expect(response).to be_success
				parsed_response = JSON.parse(response.body)
				expect(parsed_response['data']['name']).to eq('John Doe')
			end	
		end

		context 'with invalid params' do 
			it 'return an error message' do 
				post :create, { name: 'John Doe'}
				expect(response).to be_success
				parsed_response = JSON.parse(response.body)
				expect(parsed_response['errors']).to_not be_nil
			end	
		end	
	end

	describe 'PUT #update' do 
		let(:user) { create(:user) }

		context 'with valid params' do
			it 'return the updated user' do
				put :update, id: user, name: 'John Doe',address: 'Balikpapan',email: 'john.doe@mail.me'
				expect(response).to be_success
				parsed_response = JSON.parse(response.body)
				expect(parsed_response['data']['name']).to eq('John Doe')
			end	
		end

		context 'with invalid params' do 
			it 'return an error message' do 
				put :update, id: user, name: 'John Doe'
				expect(response).to be_success
				parsed_response = JSON.parse(response.body)
				expect(parsed_response['errors']).to_not be_nil
			end	
		end	
	end

	describe 'DELETE #destroy' do 
		let(:user) { create(:user) }
		it 'return 200 reponse' do 
			delete :destroy , id: user
			expect(response).to be_success
		end	
	end

	describe 'POST #join' do
		let(:user) { create(:user) }
		let(:organization) { create(:organization) }
		context 'with valid params' do 
			it 'return the user data with organization' do 
				post :join, id: user, organization_id: organization
				expect(response).to be_success
				parsed_response = JSON.parse(response.body)
				expect(parsed_response['data']['organizations']).to_not be_nil
			end	
		end
		context 'with invalid params' do 
			it 'return the error message' do 
				post :join, id: user, organization_id: nil
				expect(response).to be_success
				parsed_response = JSON.parse(response.body)
				expect(parsed_response['errors']).to_not be_nil
			end	
		end
		context 'rejoined the same organization' do
			it 'return the message already joined' do 
				post :join, id: user, organization_id: organization
				post :join, id: user, organization_id: organization
				parsed_response = JSON.parse(response.body)
				expect(parsed_response['message']).to eq('already joined')
			end	
		end	
	end

	describe 'POST #leave' do
		let(:user) { create(:user) }
		let(:organization) { create(:organization) }
		context 'with valid params' do 
			it 'return the user data with no organization' do 
				post :join, id: user, organization_id: organization
				post :leave, id: user, organization_id: organization
				expect(response).to be_success
				parsed_response = JSON.parse(response.body)
				expect(parsed_response['data']['organizations']).to eq([])
			end	
		end	
		context 'with invalid params' do 
			it 'return the error message' do 
				post :join, id: user, organization_id: organization
				post :leave, id: user, organization_id: ""
				expect(response).to be_success
				parsed_response = JSON.parse(response.body)
				expect(parsed_response['errors']).to_not be_nil
			end	
		end
		context 're leaving the same organization' do 
			it 'return message already leave' do 
				post :join, id: user, organization_id: organization
				post :leave, id: user, organization_id: organization
				post :leave, id: user, organization_id: organization
				expect(response).to be_success
				parsed_response = JSON.parse(response.body)
				expect(parsed_response['message']).to eq('already leave')
			end	
		end	
	end	
end
