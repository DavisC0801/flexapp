# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
client = Client.create!(first_name: 'Jon', last_name: 'Fav', email: 'vincecarollo@gmail.com', phone_num: '3034351644', password: 'password')
client.create_meal_plan(calories: 200, vegetarian: true, diet_type: 'high-protein')


alex = Trainer.create(first_name: "alex", last_name: "alexson", email: "alex@gmail.com", password: "password", phone_num: "5715943614")
billy = Trainer.create(first_name: "billy", last_name: "billyson", email: "billy@gmail.com", password: "password", phone_num: "5715943614")

chris = Client.create(first_name: "chris", last_name: "chrisson", email: "chris@gmail.com", password: "password", phone_num: "5715943614", trainer: alex)
kyle = Client.create(first_name: "kyle", last_name: "kyleson", email: "kyle@gmail.com", password: "password", phone_num: "5715943614", trainer: alex)
trevor = Client.create(first_name: "trevor", last_name: "trevorson", email: "trevor@gmail.com", password: "password", phone_num: "5715943614", trainer: alex)
vince = Client.create(first_name: "vince", last_name: "vinceson", email: "vince@gmail.com", password: "password", phone_num: "5715943614", trainer: billy)
adam = Client.create(first_name: "adam", last_name: "adamson", email: "adam@gmail.com", password: "password", phone_num: "5715943614", trainer: billy)
danny = Client.create(first_name: "danny", last_name: "dannyson", email: "danny@gmail.com", password: "password", phone_num: "5715943614", trainer: billy)

vince.create_meal_plan(calories: 1800, vegan: true)

vince.meal_logs.create!(name: 'pizza', meal_date: "2019-01-24", meal_time: "09:41:00.000", meal_calories: 200, meal_fats: 4, meal_carbs: 10, meal_sugars: 1, meal_protein: 9, meal_sodium: 3)
vince.meal_logs.create!(name: 'mac n cheese', meal_date: "2019-02-24", meal_time: "09:41:00.000", meal_calories: 130, meal_fats: 6, meal_carbs: 10, meal_sugars: 4, meal_protein: 10, meal_sodium: 3)
vince.meal_logs.create!(name: 'hot dog', meal_date: "2019-03-02", meal_time: "10:41:00.000", meal_calories: 122, meal_fats: 1, meal_carbs: 12, meal_sugars: 6, meal_protein: 5, meal_sodium: 2)
vince.meal_logs.create!(name: 'cheeseburger', meal_date: "2019-04-24", meal_time: "11:41:00.000", meal_calories: 600, meal_fats: 8, meal_carbs: 22, meal_sugars: 2, meal_protein: 2, meal_sodium: 7)
vince.meal_logs.create!(name: 'sausage', meal_date: "2019-05-24", meal_time: "13:41:00.000", meal_calories: 456, meal_fats: 1, meal_carbs: 31, meal_sugars: 5, meal_protein: 19, meal_sodium: 1)
vince.meal_logs.create!(name: 'salad', meal_date: "2019-06-24", meal_time: "5:41:00.000", meal_calories: 232, meal_fats: 2, meal_carbs: 12, meal_sugars: 6, meal_protein: 22, meal_sodium: 3)
vince.meal_logs.create!(name: 'tacos', meal_date: "2019-07-24", meal_time: "6:41:00.000", meal_calories: 1000, meal_fats: 10, meal_carbs: 8, meal_sugars: 2, meal_protein: 12, meal_sodium: 4)

vince.weight_logs.create(weight: 150, created_at: "Wed, 01 Jul 2019 21:13:01 UTC +00:00")
vince.weight_logs.create(weight: 155, created_at: "Wed, 02 Jul 2019 21:13:01 UTC +00:00")
vince.weight_logs.create(weight: 160, created_at: "Wed, 03 Jul 2019 21:13:01 UTC +00:00")
vince.weight_logs.create(weight: 165, created_at: "Wed, 04 Jul 2019 21:13:01 UTC +00:00")
vince.weight_logs.create(weight: 170, created_at: "Wed, 05 Jul 2019 21:13:01 UTC +00:00")
vince.weight_logs.create(weight: 165, created_at: "Wed, 06 Jul 2019 21:13:01 UTC +00:00")
vince.weight_logs.create(weight: 160, created_at: "Wed, 07 Jul 2019 21:13:01 UTC +00:00")
vince.weight_logs.create(weight: 155, created_at: "Wed, 08 Jul 2019 21:13:01 UTC +00:00")
vince.weight_logs.create(weight: 150, created_at: "Wed, 09 Jul 2019 21:13:01 UTC +00:00")
vince.weight_logs.create(weight: 145, created_at: "Wed, 10 Jul 2019 21:13:01 UTC +00:00")
vince.weight_logs.create(weight: 140, created_at: "Wed, 11 Jul 2019 21:13:01 UTC +00:00")
vince.weight_logs.create(weight: 135, created_at: "Wed, 12 Jul 2019 21:13:01 UTC +00:00")
vince.weight_logs.create(weight: 130, created_at: "Wed, 13 Jul 2019 21:13:01 UTC +00:00")
vince.weight_logs.create(weight: 135, created_at: "Wed, 24 Jul 2019 21:13:01 UTC +00:00")
