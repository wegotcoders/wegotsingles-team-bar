# encoding: UTF-8
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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20160720162048) do
=======
ActiveRecord::Schema.define(version: 20160720134607) do
>>>>>>> dev

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "profiles", force: :cascade do |t|
    t.string   "star_sign"
    t.integer  "customer_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "username"
    t.integer  "gender"
    t.integer  "ethnicity"
    t.boolean  "drinker"
    t.string   "avatars",                  array: true
    t.date     "date_of_birth"
    t.boolean  "drinker"
    t.string   "town_city"
    t.string   "country"
    t.text     "biography",     default: ""
    t.text     "desires",       default: ""
    t.boolean  "smoker"
    t.decimal  "latitude"
    t.decimal  "longitude"
  end

end
