require 'rails_helper'

describe User do
	it "has a valid factory" do
		expect(build(:user)).to be_valid
	end	
	it "is invalid without name" do 
		expect(build(:user , name: nil)).to_not be_valid
	end	
	it "is invalid without address" do 
		expect(build(:user , address: nil)).to_not be_valid
	end	
	it "is invalid without email" do
		expect(build(:user , email: nil)).to_not be_valid
	end	
end