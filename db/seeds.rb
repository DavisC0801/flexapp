# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#trainers
alex = Trainer.create(first_name: "alex", last_name: "alexson", email: "alex@gmail.com", password: "password", phone_num: "5715943614")
billy = Trainer.create(first_name: "billy", last_name: "billyson", email: "billy@gmail.com", password: "password", phone_num: "5715943614")

chris = Client.create(first_name: "chris", last_name: "chrisson", email: "chris@gmail.com", password: "password", phone_num: "5715943614", trainer: alex)
kyle = Client.create(first_name: "kyle", last_name: "kyleson", email: "kyle@gmail.com", password: "password", phone_num: "5715943614", trainer: alex)
trevor = Client.create(first_name: "trevor", last_name: "trevorson", email: "trevor@gmail.com", password: "password", phone_num: "5715943614", trainer: alex)
vince = Client.create(first_name: "vince", last_name: "vinceson", email: "vince@gmail.com", password: "password", phone_num: "5715943614", trainer: billy)
adam = Client.create(first_name: "adam", last_name: "adamson", email: "adam@gmail.com", password: "password", phone_num: "5715943614", trainer: billy)
danny = Client.create(first_name: "danny", last_name: "dannyson", email: "danny@gmail.com", password: "password", phone_num: "5715943614", trainer: billy)
