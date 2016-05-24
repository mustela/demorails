class User < ActiveRecord::Base
	validates :name , presence: true
	validates :address, presence: true
	validates :email, presence: true

	has_and_belongs_to_many :organizations
end
