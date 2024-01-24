# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

150.times do
  Movie.create(title: Faker::Movie.unique.title) 
end

# 5.times do
#   Post.create(
#     title: Faker::Lorem.sentence(word_count: 2),
#     body: Faker::Lorem.paragraph(sentence_count: 2),
#     visible: [true, false].sample
#   )
# end
# Create a main sample user.
User.create!(email: 'dean@example.com',
             password: 'password',
             password_confirmation: 'password')

User.create!(email: 'john@doe.com',
             password: 'password',
             password_confirmation: 'password')

#Room.create(name: 'Example')

# 2.times do
#   Event.create(
#     name: Faker::Lorem.unique.word,
#     location: Faker::Address.full_address,
#     start_date: Faker::Time.forward(days: 30)
#   )
# end