class User < ActiveRecord::Base
	validates :name , presence: true
	validates :address, presence: true
	validates :email, presence: true
end
