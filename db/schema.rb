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

ActiveRecord::Schema.define(version: 20160827143013) do

  create_table "cabinets", force: :cascade do |t|
    t.string   "tools"
    t.string   "liquor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cocktails", force: :cascade do |t|
    t.string   "name"
    t.string   "glass"
    t.string   "tools"
    t.string   "liquor"
    t.string   "garnish"
    t.string   "image"
    t.text     "desrciption"
    t.text     "instruction"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "cocktails", ["user_id"], name: "index_cocktails_on_user_id"

  create_table "favorites", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "cocktail_id"
  end

  add_index "favorites", ["cocktail_id"], name: "index_favorites_on_cocktail_id"
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
