require 'rails_helper'

RSpec.describe Api::V1::OrganizationsController, type: :controller do
	describe 'GET #index' do
		it 'list all organizations in json' do
			FactoryGirl.create_list(:organization,10)

			get :index
			json = JSON.parse(response.body)

			expect(response).to be_success
			expect(json['data'].length).to eq(10)
		end
	end

	describe 'GET #show' do
		let(:organization) { create(:organization) }

		it 'list an organization in json' do
			FactoryGirl.create(:organization)

			get :show , id: organization
			parsed_response = JSON.parse(response.body)
      		expect(parsed_response['data']).to_not be_nil
		end
	end

	describe 'POST #create' do
		context 'with valid params' do
			it 'return the created organization' do
				post :create, { name: 'Facebook.Inc'}
				expect(response).to be_success
				parsed_response = JSON.parse(response.body)
				expect(parsed_response['data']['name']).to eq('Facebook.Inc')
			end	
		end

		context 'with invalid params' do 
			it 'return an error message' do 
				post :create, { name: nil}
				expect(response).to be_success
				parsed_response = JSON.parse(response.body)
				expect(parsed_response['errors']).to_not be_nil
			end	
		end	
	end

	describe 'PUT #update' do 
		let(:organization) { create(:organization) }

		context 'with valid params' do
			it 'return the updated organization' do
				put :update, id: organization, name: 'Facebook.Inc'
				expect(response).to be_success
				parsed_response = JSON.parse(response.body)
				expect(parsed_response['data']['name']).to eq('Facebook.Inc')
			end	
		end

		context 'with invalid params' do 
			it 'return an error message' do 
				put :update, id: organization, name: nil
				expect(response).to be_success
				parsed_response = JSON.parse(response.body)
				expect(parsed_response['errors']).to_not be_nil
			end	
		end	
	end

	describe 'DELETE #destroy' do 
		let(:organization) { create(:organization) }
		it 'return 200 reponse' do 
			delete :destroy , id: organization
			expect(response).to be_success
		end	
	end	
end
