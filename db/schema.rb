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

ActiveRecord::Schema.define(version: 20141201172047) do

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
