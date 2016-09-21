# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Global Destroy Info
AdminUser.destroy_all
Ratinguser.destroy_all
Ratingcompany.destroy_all
Work.destroy_all
Usercompany.destroy_all
Company.destroy_all
User.destroy_all
Category.destroy_all
Template.destroy_all
Type.destroy_all



# Admin User Creation
AdminUser.create!(email: 'dicomlaboralcl@gmail.com', password: '123456', password_confirmation: '123456')

# Worker User Creation
10.times do |i|
	rut = rand.to_s[2..9]
	rut += "-#{i}"
	User.create!(email: Faker::Internet.email, firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, password: '123456', password_confirmation: '123456', dni: rut, confirmed_at: DateTime.now )
end

# Companies Seed Creation

5.times do |i|
	rut = rand.to_s[2..9]
	rut += "-#{i}"
	c = Company.create!(name: Faker::Company.name,rut: rut ,phone: "800-600-9000" ,address: Faker::Address.street_address ,activity: Faker::Company.buzzword, description: Faker::Company.catch_phrase)

	u = Usercompany.create!(firstname: Faker::Name.name, company: c, email: Faker::Internet.email , password: "123456", confirmed_at: DateTime.now )
	# u = Usercompany.create!(firstname: Faker::Name.name, company: c, email: Faker::Internet.email , password: "123456")
end

t1 = Type.create!(name: 'PERSONA')
tt1 = Template.create!(name: 'EVALUACION PERSONA 01', description: 'Este modelo tendra 5 categorias de evaluacion...', active: false, type: t1)
Category.create!(template: tt1, name: 'Presentación Personal', order: 1)
Category.create!(template: tt1, name: 'Puntualidad', order: 2)
Category.create!(template: tt1, name: 'Profesionalismo', order: 3)
Category.create!(template: tt1, name: 'Compromiso', order: 4)
Category.create!(template: tt1, name: 'Sociabilidad', order: 5)
t2 = Type.create!(name: 'EMPRESA')
tt2 = Template.create!(name: 'EVALUACION EMPRESA 01', description: 'Este modelo tendra 7 categorias de evaluacion...', active: false, type: t2)
Category.create!(template: tt2, name: 'Remuneración', order: 1)
Category.create!(template: tt2, name: 'Espacio de Trabajo', order: 2)
Category.create!(template: tt2, name: 'Bonos', order: 3)
Category.create!(template: tt2, name: 'Casino', order: 4)
Category.create!(template: tt2, name: 'Beneficios', order: 5)

types = ['PERSONA', 'EMPRESA']
10.times do
	# retorno registro aleatorio
	u2 = User.limit(1).order("RANDOM()").first
	c2 = Company.limit(1).order("RANDOM()").first
	w = Work.create!(from: types.sample, company: c2, user: u2, start_date: Faker::Date.between(10.year.ago, 1.year.ago), end_date: Faker::Date.between(1.year.ago, Date.today), comment_user: Faker::Lorem.sentence(6), comment_company: Faker::Lorem.sentence(6) )
end
