class UserOrganization < ActiveRecord::Base
	self.table_name = 'organizations_users'
	validates :user_id , presence: true
	validates :organization_id, presence: true
end
