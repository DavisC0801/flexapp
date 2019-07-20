# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_07_19_235120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.bigint "trainer_id"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_num"
    t.string "password_digest"
    t.index ["trainer_id"], name: "index_clients_on_trainer_id"
  end

  create_table "meal_logs", force: :cascade do |t|
    t.string "name"
    t.date "meal_date"
    t.time "meal_time"
    t.integer "meal_calories"
    t.integer "meal_fats"
    t.integer "meal_carbs"
    t.integer "meal_sugars"
    t.integer "meal_protein"
    t.integer "meal_sodium"
  end

  create_table "trainers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_num"
    t.string "password_digest"
  end

  add_foreign_key "clients", "trainers"
end
