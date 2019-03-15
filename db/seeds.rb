# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

30.times do
    User.create(username: Faker::Name.last_name, name: Faker::Name.first_name, avatar: Faker::Avatar.image, password: "jfive5")
end

30.times do
    Game.create(time: Faker::Date.forward, place: Faker::GameOfThrones.city, notes: "Talk trash.  Play hard.", title: Faker::Superhero.name)
end

20.times do
    UserGame.create(user_id: rand(1..20), game_id: rand(1..10))
end


