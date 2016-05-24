class CreateOrganizationsUsers < ActiveRecord::Migration
  def change
    create_table :organizations_users do |t|
    	t.belongs_to :user, index: true
    	t.belongs_to :organization, index: true
    end
  end
end
