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
  { name: "MONSTERONE",   active: true},
  { name: "MONSTERTWO",   active: true}
].each do |enemy_attributes|
  Enemy.create(enemy_attributes)
end

[
  { lat: 51.519736, lng: -0.076467, enemy_id: 1},
  { lat: 51.519750, lng: -0.074708, enemy_id: 2}
].each do |enemyloc_attributes|
  EnemyLocation.create(enemyloc_attributes)
end
