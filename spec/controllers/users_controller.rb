require 'rails_helper'
describe Api::V1::UsersController do
	describe 'POST #create' do
		it 'create user' do
			post :create, user: attributes_for(:user)
			expect(User.count).to eq(1)
		end	
	end
end