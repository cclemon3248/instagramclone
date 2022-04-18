# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  image = File.open("/Users/cclemon3248/workspace/InstagramClone/app/assets/images/FQFozlzakAAWViG.jpeg")
  User.create!(name: name,
               email: email,
               password: password,
               image: image,
               )
end