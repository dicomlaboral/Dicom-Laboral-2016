# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Global Destroy Info
AdminUser.destroy_all
Company.destroy_all


# Admin User Creation
AdminUser.create!(email: 'dicomlaboralcl@gmail.com', password: '123456', password_confirmation: '123456')

# Companies Seed Creation

5.times do |i|
	rut = rand.to_s[2..9]
	rut += "-#{i}"
	c = Company.create!(name: Faker::Company.name,rut: rut ,phone: "800-600-9000" ,address: Faker::Address.street_address ,activity: Faker::Company.buzzword)
end