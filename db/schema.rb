# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2020_04_12_131258) do
=======
ActiveRecord::Schema.define(version: 2020_04_15_111423) do
>>>>>>> add not null attribute for all company columns
=======
ActiveRecord::Schema.define(version: 2020_04_15_125004) do
>>>>>>> add index to unique attribute for company
=======
ActiveRecord::Schema.define(version: 2020_04_15_111423) do
>>>>>>> fix chenges

=======
ActiveRecord::Schema.define(version: 20_200_415_111_423) do
>>>>>>> fix rubocop mistakes
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

<<<<<<< HEAD
  create_table "cities", force: :cascade do |t|
    t.string "name"
  end 
  
  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "role"
=======
  create_table 'cities', force: :cascade do |t|
    t.string 'name', null: false
>>>>>>> fix rubocop mistakes
  end

  create_table 'companies', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'city', null: false
    t.string 'district', null: false
    t.string 'address', null: false
    t.string 'email_registration', null: false
    t.string 'email_notification', null: false
    t.string 'password_digest', null: false
    t.string 'state', null: false
    t.string 'phone', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['name'], name: 'index_companies_on_name', unique: true
  end

  create_table 'users', force: :cascade do |t|
    t.string 'first_name'
    t.string 'second_name'
    t.string 'email'
    t.string 'password_digest'
    t.string 'phone'
    t.string 'state'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'city_id'
    t.index ['city_id'], name: 'index_users_on_city_id'
  end

<<<<<<< HEAD
<<<<<<< HEAD
  add_foreign_key "users", "cities"
=======
>>>>>>> modifications
=======
  add_foreign_key 'users', 'cities'
>>>>>>> fix rubocop mistakes
end
