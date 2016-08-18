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
Usercompany.destroy_all
Template.destroy_all
Type.destroy_all


# Admin User Creation
AdminUser.create!(email: 'dicomlaboralcl@gmail.com', password: '123456', password_confirmation: '123456')

# Companies Seed Creation

5.times do |i|
	rut = rand.to_s[2..9]
	rut += "-#{i}"
	c = Company.create!(name: Faker::Company.name,rut: rut ,phone: "800-600-9000" ,address: Faker::Address.street_address ,activity: Faker::Company.buzzword)

	u = Usercompany.create!(firstname: Faker::Name.name, company: c, email: Faker::Internet.email , password: "123456" )
	u = Usercompany.create!(firstname: Faker::Name.name, company: c, email: Faker::Internet.email , password: "123456")
end

t1 = Type.create!(name: 'PERSONA')
Template.create!(name: 'EVALUACION PERSONA 01', description: 'Este modelo tendra 5 categorias de evaluacion...', active: false, type: t1)
t2 = Type.create!(name: 'EMPRESA')
Template.create!(name: 'EVALUACION EMPRESA 01', description: 'Este modelo tendra 7 categorias de evaluacion...', active: false, type: t2)