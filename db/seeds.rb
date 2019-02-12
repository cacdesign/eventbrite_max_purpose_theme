# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

#User.destroy_all
#Event.destroy_all
#Attendance.destroy_all



# - Je crée mes Utilisateurs
5.times do |index|
	u = User.create(email: Faker::Internet.email , encrypted_password: SecureRandom.urlsafe_base64 ,description:Faker::Dune.saying ,first_name: Faker::DragonBall.character , last_name: Faker::Zelda.character)
	
	p "L'utilisateur #{u.first_name} a été crée"
end


#Je crée mes évènements
10.times do |index|
	e=Event.create(start_date: DateTime.new(2019,rand(1..12),rand(1..28)), duration:[30,45,60,90].sample , title:Faker::HarryPotter.house , description:Faker::HarryPotter.quote , price: rand(1..1000) , location:Faker::WorldCup.city , admin: User.all.sample)
	p "L'evenement #{e.title} a été crée"
end


#Je crée mes attendances
100.times do |index|
a=Attendance.create(stripe_customer_id:  SecureRandom.urlsafe_base64, user: User.all.sample, event: Event.all.sample)
p "Une nouvelle Attendance avec  #{a.user.first_name} partcipant à #{a.event.title} a été crée" 
end

=begin

#for test mail
1.times do |index|
	u = User.create(email: "micheleventbrite@yopmail.com" , encrypted_password: SecureRandom.urlsafe_base64 ,description:Faker::Dune.saying ,first_name: Faker::DragonBall.character , last_name: Faker::Zelda.character)	
	p "L'utilisateur #{u.first_name} a été crée"
end





# - Je crée mes Utilisateurs
1.times do |index|
	u = User.create(email: "micheleventbrite@yopmail.com" , encrypted_password: SecureRandom.urlsafe_base64 ,description:Faker::Dune.saying ,first_name: Faker::DragonBall.character , last_name: Faker::Zelda.character)
	
	p "L'utilisateur #{u.first_name} a été crée"
end



#Je crée mes évènements
5.times do |index|
	e=Event.create(start_date: DateTime.new(2019,rand(1..12),rand(1..28)), duration:[30,45,60,90].sample , title:Faker::HarryPotter.house , description:Faker::HarryPotter.quote , price: rand(1..1000) , location:Faker::WorldCup.city , admin: User.all.sample)
	p "L'evenement #{e.title} a été crée"
end


#Je crée mes attendances
10.times do |index|
a=Attendance.create(stripe_customer_id:  SecureRandom.urlsafe_base64, user: User.all.sample, event: Event.all.sample)
p "Une nouvelle Attendance avec  #{a.user.first_name} partcipant à #{a.event.title} a été crée" 
end

=end

