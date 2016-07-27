# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


[
  { name: "Anna",   email: "anna@example.com"},
  { name: "Tim", email: "tim@example.com"},
  { name: "Alistair",  email: "alistair@example.com"},
  { name: "Enzo", email: "enzo@example.com"},
  { name: "Graham", email: "graham@example.com"},
  { name: "Lukasz",   email: "lukasz@example.com"}
].each do |user_attributes|
  User.create(user_attributes)
end
