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

ActiveRecord::Schema.define(version: 20160722133652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["email"], name: "index_customers_on_email", unique: true, using: :btree
  add_index "customers", ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true, using: :btree

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "replied_to_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "star_sign"
    t.integer  "customer_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "username"
    t.integer  "gender"
    t.integer  "ethnicity"
    t.date     "date_of_birth"
    t.boolean  "drinker"
    t.string   "town_city"
    t.string   "country"
    t.text     "biography",     default: ""
    t.text     "desires",       default: ""
    t.boolean  "smoker"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "industry"
    t.decimal  "weight"
    t.string   "avatars",                                 array: true
    t.string   "religion"
  end

end
