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

ActiveRecord::Schema.define(version: 20160226173606) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fav_kinds", force: true do |t|
    t.integer  "user_id"
    t.integer  "genre_id"
    t.integer  "movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fav_kinds", ["user_id"], name: "index_fav_kinds_on_user_id", using: :btree

  create_table "fav_lists", force: true do |t|
    t.integer  "user_id"
    t.integer  "movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fav_lists", ["movie_id"], name: "index_fav_lists_on_movie_id", using: :btree
  add_index "fav_lists", ["user_id"], name: "index_fav_lists_on_user_id", using: :btree

  create_table "genres", force: true do |t|
    t.integer  "genre_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movies", force: true do |t|
    t.string   "title"
    t.integer  "movie_id"
    t.string   "pic"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wish_lists", force: true do |t|
    t.integer  "user_id"
    t.integer  "movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wish_lists", ["movie_id"], name: "index_wish_lists_on_movie_id", using: :btree
  add_index "wish_lists", ["user_id"], name: "index_wish_lists_on_user_id", using: :btree

end
