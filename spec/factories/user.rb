require 'faker'

FactoryGirl.define do
	factory :user do 
		name { Faker::Name.name }
		address { Faker::Address.street_address+', '+Faker::Address.city }
		email { Faker::Internet.free_email }
	end	
end	