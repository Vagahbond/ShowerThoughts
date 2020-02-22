# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tags = []

5.times do
  tags << Tag.create(name: Faker::Name.unique.name,
                     uses: Faker::Number.number(digits: 1))
end

4.times do
  user = User.create(username: Faker::Superhero.name,
                     password: '\jLNwj_#(vB8P.4v])y,n)NMzmCV(',
                     email: Faker::Internet.email,
                     profile_pic: Faker::Internet.url)
  3.times do
    shower_thought = Showerthought.create(content: Faker::Lorem.sentence,
                                          context: Faker::Lorem.sentence,
                                          user: user)
    Thumb.create(direction: Faker::Boolean.boolean(true_ratio: 0.5),
                 user: user, showerthought: shower_thought)
    tags.each do |tag|
      Tagged.create(showerthought: shower_thought,
                    tag: tag)
    end
    2.times do
      Comment.create(content: Faker::Lorem.sentence,
                     user: user, showerthought: shower_thought)
    end
  end
end