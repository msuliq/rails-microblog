# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: 'Admin User',
             email: ENV['DBSEED_USERNAME'],
             password: ENV['DBSEED_PASSWORD'],
             password_confirmation: ENV['DBSEED_PASSWORD_CONFIRMATION'],
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: 'Sample User',
              email: "example@railstutorial.org",
              password: "foobaz",
              password_confirmation: "foobaz",
              activated: true,
              activated_at: Time.zone.now)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@railstutorial.org"
  password = 'password'
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

# Microposts
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content: content) }
end

# Relationships

users = User.all
user = users.first
following = users [2..50]
followers = users [3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
