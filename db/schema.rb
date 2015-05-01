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

ActiveRecord::Schema.define(version: 20150501180955) do

  create_table "activities", force: true do |t|
    t.integer  "sendable_id"
    t.string   "sendable_type"
    t.integer  "receivable_id"
    t.string   "receivable_type"
    t.string   "action"
    t.integer  "causable_id"
    t.string   "causable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "targetable_id"
    t.string   "targetable_type"
    t.boolean  "has_receiver_read", default: false
  end

  add_index "activities", ["causable_id", "causable_type"], name: "index_activities_on_causable_id_and_causable_type", using: :btree
  add_index "activities", ["receivable_id", "receivable_type"], name: "index_activities_on_receivable_id_and_receivable_type", using: :btree
  add_index "activities", ["sendable_id", "sendable_type"], name: "index_activities_on_sendable_id_and_sendable_type", using: :btree
  add_index "activities", ["targetable_id", "targetable_type"], name: "index_activities_on_targetable_id_and_targetable_type", using: :btree

  create_table "comments", force: true do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "comment_publishable_id"
    t.string   "comment_publishable_type"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree

  create_table "configuration_locations", force: true do |t|
    t.integer  "configurable_location_id"
    t.string   "configurable_location_type"
    t.float    "radius",                     limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "configuration_post_categories", force: true do |t|
    t.string   "values"
    t.integer  "configurable_post_category_id"
    t.string   "configurable_post_category_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "configuration_post_categories", ["configurable_post_category_id", "configurable_post_category_type"], name: "index_configuration_post_categories_id_and_type", using: :btree

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

  create_table "post_photos", force: true do |t|
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_texts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.integer  "postable_id"
    t.string   "postable_type"
    t.integer  "post_publishable_id"
    t.string   "post_publishable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
    t.integer  "spreads_count",         default: 0
    t.integer  "contains_count",        default: 0
    t.integer  "comments_count",        default: 0
    t.integer  "views_count",           default: 0
    t.string   "category",              default: "standard"
  end

  add_index "posts", ["post_publishable_id", "post_publishable_type"], name: "index_posts_on_post_publishable_id_and_post_publishable_type", using: :btree
  add_index "posts", ["postable_id", "postable_type"], name: "index_posts_on_postable_id_and_postable_type", using: :btree

  create_table "propagations", force: true do |t|
    t.integer  "propagatable_id"
    t.string   "propagatable_type"
    t.float    "total",             limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "propagations", ["propagatable_id", "propagatable_type"], name: "index_propagations_on_propagatable_id_and_propagatable_type", using: :btree

  create_table "spreads", force: true do |t|
    t.integer  "spreadable_id"
    t.string   "spreadable_type"
    t.integer  "spread_publishable_id"
    t.string   "spread_publishable_type"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spreads", ["spread_publishable_id", "spread_publishable_type"], name: "index_spreads_on_spread_publishable_id_and_type", using: :btree
  add_index "spreads", ["spreadable_id", "spreadable_type"], name: "index_spreads_on_spreadable_id_and_type", using: :btree

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
    t.string   "profile_picture"
    t.string   "profile_picture_medium"
  end

  create_table "views", force: true do |t|
    t.integer  "viewable_id"
    t.string   "viewable_type"
    t.integer  "view_publishable_id"
    t.string   "view_publishable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "views", ["view_publishable_id", "view_publishable_type"], name: "index_views_on_view_publishable_id_and_view_publishable_type", using: :btree
  add_index "views", ["viewable_id", "viewable_type"], name: "index_views_on_viewable_id_and_viewable_type", using: :btree

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end
