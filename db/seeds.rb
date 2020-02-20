# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(username: Faker::Superhero.name, password: '\jLNwj_#(vB8P.4v])y,n)NMzmCV(', email: Faker::Internet.email, profile_pic: Faker::Internet.url)

5.times do
  Showerthought.create(content: Faker::Lorem.sentence,
                       context: Faker::Lorem.sentence, user: user)
end


