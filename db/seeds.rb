# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
Role.destroy_all
Project.destroy_all
User.destroy_all


puts 'La construction des categories commence !'

categories = ['Tech', 'Fintech', 'Ecologie', 'Agro-alimentaire', 'Mode']
categories.each do |category|
  Category.create(category: category)
end

puts 'La construction des users commence !'

user1 = User.new(email: 'aurore@gmail.com', password: 'password', first_name: 'Aurore', last_name: 'Demierre', phone_number: '06 58 93 26 17', city: 'Marseille', zip_code: 13000, country: 'France', title: 'Développeur web', description: "De nature curieuse, optimiste et déterminée, j'ai toujours à cœur de mener à bien les projets dans lesquels je m’implique et j'apprécie être à l'initiative de projets audacieux! Sans arrêt à l’affut de ce qui se passe autour de moi, afin de mieux me réinventer, repousser les obstacles et rendre possible l’impossible !", admin: false, url_linkedin: 'https://www.linkedin.com/in/aurore-demierre/')
user1.photo.attach(io: open('seed_images/w1.jpg'), filename: 'avatar1.jpg', content_type: 'image/jpg')
user1.save!

user2 = User.new(email: 'adrien@gmail.com', password: 'password', first_name: 'Adrien', last_name: 'Berger', phone_number: '06 79 09 38 18', city: 'Lyon', zip_code: 69000, country: 'France', title: 'Ingénieur', description: "Mes trois années d'apprentissage dans l'industrie m'ont permis d'acquérir de nombreuses compétences techniques. En parallèle, j'ai découvert le monde du commerce en créant mes propres entreprises. La gestion de projet, le travail d'équipe et la relation client sont mes points forts.", admin: true, url_linkedin: 'https://www.linkedin.com/in/adrien-barbier-5b479598/')
user2.photo.attach(io: open('seed_images/m1.jpg'), filename: 'avatar2.jpg', content_type: 'image/jpg')
user2.save!

user3 = User.new(email: 'marc@gmail.com', password: 'password', first_name: 'Marc', last_name: 'Bidoul', phone_number: '06 79 09 38 18', city: 'Lyon', zip_code: 69000, country: 'France', title: 'Ingénieur', description: "Mes trois années d'apprentissage dans l'industrie m'ont permis d'acquérir de nombreuses compétences techniques. En parallèle, j'ai découvert le monde du commerce en créant mes propres entreprises. La gestion de projet, le travail d'équipe et la relation client sont mes points forts.", admin: false, url_linkedin: 'https://www.linkedin.com/in/adrien-barbier-5b479598/')
user3.photo.attach(io: open('seed_images/m2.jpg'), filename: 'avatar3.jpg', content_type: 'image/jpg')
user3.save!

user4 = User.new(email: 'paula@gmail.com', password: 'password', first_name: 'Paula', last_name: 'Bilu', phone_number: '06 79 09 38 18', city: 'Lyon', zip_code: 69000, country: 'France', title: 'Ingénieur', description: "Mes trois années d'apprentissage dans l'industrie m'ont permis d'acquérir de nombreuses compétences techniques. En parallèle, j'ai découvert le monde du commerce en créant mes propres entreprises. La gestion de projet, le travail d'équipe et la relation client sont mes points forts.", admin: false, url_linkedin: 'https://www.linkedin.com/in/adrien-barbier-5b479598/')
user4.photo.attach(io: open('seed_images/w2.jpg'), filename: 'avatar4.jpg', content_type: 'image/jpg')
user4.save!

skills = ['Management', 'Développement web', 'Mécanique', 'Communication', 'Design']
users = User.all

puts 'La construction des compétences commence !'

skills.each do |skill|
  ability = Ability.create(name: skill)
  puts "Ca créer l'Ability #{skill}"
  users.each do |user|
    puts "Ca créer la Skill pour #{user.first_name}"
    skill1 = Skill.new(title: skill, description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', rate: rand(1..9), user: user, ability: ability )
    skill1.save!
  end
end


puts 'La construction des projets commence !'

project1 = Project.new(name: 'Calendar.AI', description: "Calendar.AI is a calendar app and appointment scheduler that supercharges your meetings with insights about the people and companies you meet. View work history, social profiles, news and more. Save hours scheduling meetings with your own scheduling assistant.", website_url: "https://www.sync.ai/calendar-ai/", user: user1, category: Category.find(1), tag_names: 'Banque Digital')
project1.images.attach(io: open('seed_images/p1.jpg'), filename: 'image1.jpg', content_type: 'image/jpg')
project1.images.attach(io: open('seed_images/p2.jpg'), filename: 'image2.jpg', content_type: 'image/jpg')
project1.images.attach(io: open('seed_images/p3.jpg'), filename: 'image3.jpg', content_type: 'image/jpg')
project1.images.attach(io: open('seed_images/p4.jpg'), filename: 'image4.jpg', content_type: 'image/jpg')
project1.save!

project2 = Project.new(name: 'Glitterly', description: "The video editor for making short video clips of your apps. Produce high-quality videos without watermarks.", website_url: "https://glitterly.app/?ref=producthunt", user: user1, category: Category.find(2), tag_names: 'Mode Communication')
project2.images.attach(io: open('seed_images/p1.jpg'), filename: 'image1.jpg', content_type: 'image/jpg')
project2.images.attach(io: open('seed_images/p2.jpg'), filename: 'image2.jpg', content_type: 'image/jpg')
project2.images.attach(io: open('seed_images/p3.jpg'), filename: 'image3.jpg', content_type: 'image/jpg')
project2.images.attach(io: open('seed_images/p4.jpg'), filename: 'image4.jpg', content_type: 'image/jpg')
project2.save!

project3 = Project.new(name: 'Helppie.me', description: "Get feedback from your users in a different way", website_url: "https://helppie.me/?ref=producthunt", user: user1, category: Category.find(3), tag_names: 'Luxe Horlogerie')
project3.images.attach(io: open('seed_images/p1.jpg'), filename: 'image1.jpg', content_type: 'image/jpg')
project3.images.attach(io: open('seed_images/p2.jpg'), filename: 'image2.jpg', content_type: 'image/jpg')
project3.images.attach(io: open('seed_images/p3.jpg'), filename: 'image3.jpg', content_type: 'image/jpg')
project3.images.attach(io: open('seed_images/p4.jpg'), filename: 'image4.jpg', content_type: 'image/jpg')
project3.save!

project4 = Project.new(name: 'purME', description: "purME is an all-new type of mask. It is crystal-clear, modular, lightweight and comfortable. By wearing it, you are protected against all sorts of harmful particles such as PM2.5 and allergen, both as airborne or droplets.", website_url: "https://www.indiegogo.com/projects/purme-a-gas-mask-you-can-wear-everyday--2?secret_perk_token=713c4160&utm_source=product+hunt&utm_medium=ph#/", user: user2, category: Category.find(2), tag_names: 'Agro-alimentaire Food')
project4.images.attach(io: open('seed_images/p1.jpg'), filename: 'image1.jpg', content_type: 'image/jpg')
project4.images.attach(io: open('seed_images/p2.jpg'), filename: 'image2.jpg', content_type: 'image/jpg')
project4.images.attach(io: open('seed_images/p3.jpg'), filename: 'image3.jpg', content_type: 'image/jpg')
project4.images.attach(io: open('seed_images/p4.jpg'), filename: 'image4.jpg', content_type: 'image/jpg')
project4.save!

project5 = Project.new(name: 'Glimpse 2.0', description: "Glimpse matches large groups into 1:1 time-boxed video chats. We build authentic relationships within any large groups: from your team at work, networking during a conference, to college social group rush!", website_url: "https://app.joinglimpse.com/?ref=producthunt", user: user2, category: Category.find(1), tag_names: 'Banque Digital')
project5.images.attach(io: open('seed_images/p1.jpg'), filename: 'image1.jpg', content_type: 'image/jpg')
project5.images.attach(io: open('seed_images/p2.jpg'), filename: 'image2.jpg', content_type: 'image/jpg')
project5.images.attach(io: open('seed_images/p3.jpg'), filename: 'image3.jpg', content_type: 'image/jpg')
project5.images.attach(io: open('seed_images/p4.jpg'), filename: 'image4.jpg', content_type: 'image/jpg')
project5.save!

puts 'La construction des role commence !'

role1 = Role.new(role: 'Editor', user: user2, project: project4)
role1.save!
role2 = Role.new(role: 'Editor', user: user3, project: project3)
role2.save!
role3 = Role.new(role: 'Editor', user: user4, project: project1)
role3.save!

role4 = Role.new(role: 'Viewer', user: user2, project: project4)
role4.save!
role5 = Role.new(role: 'Viewer', user: user1, project: project1)
role5.save!
role6 = Role.new(role: 'Viewer', user: user4, project: project1)
role6.save!






