# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Deleting all data ❌'

User.delete_all
Collection.delete_all
Request.delete_all
Attrib.delete_all
Body.delete_all

puts 'Seeding users data'
puts 'Seeding collections data'
puts 'Seeding requests data'
puts 'Seeding attribs data'
puts 'Seeding bodies data'

user1 = User.create(username: Faker::Name.unique.first_name, password_digest: '123')
user2 = User.create(username: Faker::Name.unique.first_name, password_digest: '123')
user3 = User.create(username: Faker::Name.unique.first_name, password_digest: '123')

collections = ['PoetryDB', 'Calendarific API', 'OCR API', 'Unsorted']
metods = ['GET', 'POST', 'PUT', 'PATCH', 'DELETE']

collections.each do |c|
  Collection.create(
    name: c,
    user_id: user1.id
  )
end

20.times do
  Request.create(
    title: Faker::Hipster.word,
    method: metods.sample(),
    url: Faker::Internet.url(host: 'example.com'),
    collection_id: Collection.all.sample().id
  )
end

puts 'Done 👌'

