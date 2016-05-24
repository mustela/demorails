# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..50).each do
	name = Faker::Name.name
	User.create({
		name: name,
		address: Faker::Address.street_address+', '+Faker::Address.city,
		email: Faker::Internet.free_email(name)
	})
end

(1..10).each do
	Organization.create({
		name: Faker::Company.name
	})
end	
