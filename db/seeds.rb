# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
client = Client.create!(first_name: 'Jon', last_name: 'Fav', email: 'vincecarollo@gmail.com', phone_num: '3034351644', password: 'password')
client.create_meal_plan(calories: 200, vegetarian: true, diet_type: 'high-protein')
