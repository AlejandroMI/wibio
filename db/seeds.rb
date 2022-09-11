# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# A human
user = User.create(
  nickname: "human",
  full_name: "Human Earth",
  about: "Hey! I am just a human",
  email: "human@earth.com",
  password: "Passw0rd!",
  password_confirmation: "Passw0rd!",
)

puts "🌱 Database seeded with user. nickname: human | password: Passw0rd!"
puts "💡 Feel free to signup and develop with your own user!"

# With three links
Link.create(name: "My website", url: "https://google.com", bio: user.bio)
Link.create(name: "Some info about my species", url: "https://en.wikipedia.org/wiki/Human", bio: user.bio)
Link.create(name: "One of my favourite songs", url: "https://open.spotify.com/track/1sTsuZTdANkiFd7T34H3nb", bio: user.bio)
