# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all

Category.create!(category: 'Tech')
Category.create!(category: 'Banque')
Category.create!(category: 'Ecolo')

categories = ['Tech', 'Fintech', 'Ecologie']
categories.each do |category|
  Category.create(category: category)
end




user1 = User.new(email: 'aurore@gmail.com', password: 'password', first_name: 'Aurore', last_name: 'Demierre', phone_number: '06 58 93 26 17', city: 'Marseille', zip_code: 13000, country: 'France', title: 'Développeur web', description: "De nature curieuse, optimiste et déterminée, j'ai toujours à cœur de mener à bien les projets dans lesquels je m’implique et j'apprécie être à l'initiative de projets audacieux! Sans arrêt à l’affut de ce qui se passe autour de moi, afin de mieux me réinventer, repousser les obstacles et rendre possible l’impossible !", admin: false, url_linkedin: 'https://www.linkedin.com/in/aurore-demierre/', avatar: '/uploads/IMG_7030.jpeg')
user1.save!
user2 = User.new(email: 'adrien@gmail.com', password: 'password', first_name: 'Adrien', last_name: 'Barbier', phone_number: '06 79 09 38 18', city: 'Lyon', zip_code: 69000, country: 'France', title: 'Ingénieur', description: "Mes trois années d'apprentissage dans l'industrie m'ont permis d'acquérir de nombreuses compétences techniques. En parallèle, j'ai découvert le monde du commerce en créant mes propres entreprises. La gestion de projet, le travail d'équipe et la relation client sont mes points forts.", admin: true, url_linkedin: 'https://www.linkedin.com/in/adrien-barbier-5b479598/', avatar: '/uploads/IMG_7030.jpeg')
user2.save!
user3 = User.new(email: 'marc@gmail.com', password: 'password', first_name: 'Marc', last_name: 'Barbier', phone_number: '06 79 09 38 18', city: 'Lyon', zip_code: 69000, country: 'France', title: 'Ingénieur', description: "Mes trois années d'apprentissage dans l'industrie m'ont permis d'acquérir de nombreuses compétences techniques. En parallèle, j'ai découvert le monde du commerce en créant mes propres entreprises. La gestion de projet, le travail d'équipe et la relation client sont mes points forts.", admin: false, url_linkedin: 'https://www.linkedin.com/in/adrien-barbier-5b479598/', avatar: '/uploads/IMG_7030.jpeg')
user3.save!
user4 = User.new(email: 'paul@gmail.com', password: 'password', first_name: 'paul', last_name: 'Barbier', phone_number: '06 79 09 38 18', city: 'Lyon', zip_code: 69000, country: 'France', title: 'Ingénieur', description: "Mes trois années d'apprentissage dans l'industrie m'ont permis d'acquérir de nombreuses compétences techniques. En parallèle, j'ai découvert le monde du commerce en créant mes propres entreprises. La gestion de projet, le travail d'équipe et la relation client sont mes points forts.", admin: false, url_linkedin: 'https://www.linkedin.com/in/adrien-barbier-5b479598/', avatar: '/uploads/IMG_7030.jpeg')
user4.save!

project1 = Project.new(name: 'Calendar.AI', description: "Calendar.AI is a calendar app and appointment scheduler that supercharges your meetings with insights about the people and companies you meet. View work history, social profiles, news and more. Save hours scheduling meetings with your own scheduling assistant.", website_url: "https://www.sync.ai/calendar-ai/", user: user1, category: Category.find(1))
project1.save!
project2 = Project.new(name: 'Glitterly', description: "The video editor for making short video clips of your apps. Produce high-quality videos without watermarks.", website_url: "https://glitterly.app/?ref=producthunt", user: user1, category: Category.find(2))
project2.save!
project3 = Project.new(name: 'Helppie.me', description: "Get feedback from your users in a different way", website_url: "https://helppie.me/?ref=producthunt", user: user1, category: Category.find(3))
project3.save!
project4 = Project.new(name: 'purME', description: "purME is an all-new type of mask. It is crystal-clear, modular, lightweight and comfortable. By wearing it, you are protected against all sorts of harmful particles such as PM2.5 and allergen, both as airborne or droplets.", website_url: "https://www.indiegogo.com/projects/purme-a-gas-mask-you-can-wear-everyday--2?secret_perk_token=713c4160&utm_source=product+hunt&utm_medium=ph#/", user: user2, category: Category.find(2))
project4.save!
project5 = Project.new(name: 'Glimpse 2.0', description: "Glimpse matches large groups into 1:1 time-boxed video chats. We build authentic relationships within any large groups: from your team at work, networking during a conference, to college social group rush!", website_url: "https://app.joinglimpse.com/?ref=producthunt", user: user2, category: Category.find(1))
project5.save!

role1 = Role.new(role: 'Editor', user: user2, project: project4)
role1.save!
role2 = Role.new(role: 'Editor', user: user3, project: project4)
role2.save!
role3 = Role.new(role: 'Editor', user: user4, project: project4)
role3.save!





