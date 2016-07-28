# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
  { name: "Anna",   email: "anna@example.com", password: "password"},
  { name: "Tim", email: "tim@example.com", password: "password"}
].each do |user_attributes|
  User.create(user_attributes)
end

[
  { lat: 51.518971, lng: -0.074418, user_id: 1},
  { lat: 49.054587, lng: -122.328026, user_id: 2}
].each do |userloc_attributes|
  UserLocation.create(userloc_attributes)
end


[
  { name: "Makers Monster",            active: true, size: 50},
  { name: "Aldgate East Tube Monster", active: true, size: 10},
  { name: "Aldgate Tower Monster",   active: true, size: 5},
  { name: "Spitalfields Monster",   active: true, size: 1},
  { name: "Chicken Katsu Wrap Monster", active: true, size: 11}
  ].each do |enemy_attributes|
  Enemy.create(enemy_attributes)
end

[
  { lat: 51.51734, lng: -0.0732808, enemy_id: 1},
  { lat: 51.515486, lng: -0.0726127, enemy_id: 2},
  { lat: 51.5148623, lng: -0.07222109, enemy_id: 3},
  { lat: 51.5193838, lng: -0.0757565, enemy_id: 4},
  { lat: 51.5156715, lng: -0.07458440, enemy_id: 5},
].each do |enemyloc_attributes|
  EnemyLocation.create(enemyloc_attributes)
end
