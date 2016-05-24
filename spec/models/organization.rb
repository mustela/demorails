require 'rails_helper'

describe Organization do
	it "has a valid factory" do
		expect(build(:organization)).to be_valid
	end	
	it "is invalid without name" do 
		expect(build(:organization , name: nil)).to_not be_valid
	end
end