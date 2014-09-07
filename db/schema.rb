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

ActiveRecord::Schema.define(version: 20140629164012) do

  create_table "dorms", force: true do |t|
    t.string   "name",       default: "Unknown"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "floors", force: true do |t|
    t.integer  "dorm_id"
    t.string   "name",       default: "Unknown"
    t.string   "gender",     default: "Male"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "floors", ["dorm_id"], name: "index_floors_on_dorm_id"

  create_table "pickadates", force: true do |t|
    t.integer  "floor_id"
    t.string   "title",       default: "You'll really want to change this..."
    t.string   "location",    default: "Maybe in your dorm's lobby?"
    t.datetime "time",        default: '2014-07-18 00:12:09'
    t.string   "description", default: "You might describe what the date will be here..."
    t.integer  "creator"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "cost",        default: 0.0
  end

  add_index "pickadates", ["floor_id"], name: "index_pickadates_on_floor_id"

  create_table "user_pickadates", force: true do |t|
    t.string   "rsvpstatus"
    t.integer  "user_id"
    t.integer  "invited_by"
    t.string   "user_type",    default: "host"
    t.integer  "pickadate_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_pickadates", ["pickadate_id"], name: "index_user_pickadates_on_pickadate_id"
  add_index "user_pickadates", ["user_id"], name: "index_user_pickadates_on_user_id"

  create_table "users", force: true do |t|
    t.integer  "floor_id"
    t.string   "email"
    t.string   "username"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "major",              default: "unspecified"
    t.string   "aboutme",            default: "Apparently I was too lazy to change this myself"
    t.string   "hometown",           default: "Upland, Indiana"
    t.string   "relationshipstatus", default: "Unspecified"
    t.string   "pictureurl",         default: "http://imgur.com/1qXcMaY.jpg"
    t.string   "firstname",          default: "John"
    t.string   "lastname",           default: "Smith"
    t.integer  "age",                default: 18
    t.integer  "year",               default: 2018
    t.boolean  "admin",              default: false
    t.boolean  "first",              default: true
    t.boolean  "pa",                 default: false
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gender",             default: "Male"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["floor_id"], name: "index_users_on_floor_id"
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
