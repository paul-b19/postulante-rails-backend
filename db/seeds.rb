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

40.times do
  Attrib.create(
    attr_type: ['params', 'headers'].sample(),
    key: Faker::Hipster.word,
    value: Faker::Hipster.word,
    description: Faker::Hipster.word,
    request_id: Request.all.sample().id
  )
end

20.times do
  Attrib.create(
    attr_type: 'auth',
    key: Faker::Hipster.word,
    value: Faker::Hipster.word,
    description: ['headers', 'params'].sample(),
    request_id: Request.all.sample().id
  )
end

i = 0
40.times do
  Body.create(
    body_type: "#{i % 2 === 0 ? 'Form-Data' : 'Raw'}",
    key: "#{i % 2 === 0 ? Faker::Hipster.word : nil}",
    value: "#{i % 2 === 0 ? Faker::Hipster.word : nil}",
    description: "#{i % 2 === 0 ? Faker::Hipster.word : nil}",
    raw_body: "#{i % 2 === 1 ? Faker::Hipster.word : nil}",
    request_id: Request.all.sample().id
  )
  i += 1
end

puts 'Done 👌'

