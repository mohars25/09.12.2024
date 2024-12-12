# villes
saint_louis = City.create(name: "Saint-Louis")
paris = City.create(name: "Paris")
strasbourg = City.create(name: "Strasbourg")

# utilisateurs
User.create(first_name: "Mohamed", last_name: "Bouflija", email: "mohamed.bouflija@example.com", city_id: saint_louis.id)
User.create(first_name: "Florian", last_name: "vvv", email: "florian.vvv@example.com", city_id: paris.id)
User.create(first_name: "Mathieu", last_name: "bbb", email: "Mathieu.bbb@example.com", city_id: strasbourg.id)

# gossips
Gossip.create(title: "Un scoop à Saint-Louis", content: "Mohamed Ali a une grande annonce !", user: User.first)
Gossip.create(title: "Paris en ébullition", content: "Florian prépare un grand événement.", user: User.second)
Gossip.create(title: "Strasbourg en fête", content: "Mathieu célèbre une promotion incroyable.", user: User.third)

# ajouter des gossips aléatoires
users = User.all

users.each do |user|
  3.times do
    Gossip.create(
      title: Faker::Lorem.sentence(word_count: 3),
      content: Faker::Lorem.paragraph,
      user: user
    )
  end
end
