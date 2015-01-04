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

ActiveRecord::Schema.define(version: 20150104124458) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "grouping"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conversations", force: true do |t|
    t.string   "title"
    t.integer  "conversable_id"
    t.string   "conversable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  add_index "conversations", ["category_id"], name: "index_conversations_on_category_id", using: :btree
  add_index "conversations", ["conversable_id", "conversable_type"], name: "index_conversations_on_conversable_id_and_conversable_type", using: :btree

  create_table "jw_tokens", force: true do |t|
    t.string   "value"
    t.string   "ip_address"
    t.integer  "jw_tokenable_id"
    t.string   "jw_tokenable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "expires_at"
  end

  add_index "jw_tokens", ["jw_tokenable_id", "jw_tokenable_type"], name: "index_jw_tokens_on_jw_tokenable_id_and_jw_tokenable_type", using: :btree

  create_table "locations", force: true do |t|
    t.integer  "locatable_id"
    t.string   "locatable_type"
    t.float    "latitude",       limit: 24
    t.float    "longitude",      limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
  end

  add_index "locations", ["locatable_id", "locatable_type"], name: "index_locations_on_locatable_id_and_locatable_type", using: :btree

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "name"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "expires_at"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gender"
  end

end
