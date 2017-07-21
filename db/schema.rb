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

ActiveRecord::Schema.define(version: 20170721195443) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cohorts", force: :cascade do |t|
    t.string "name"
    t.date "start"
    t.date "end"
    t.text "url"
    t.date "pitch_start"
    t.date "pitch_end"
    t.date "round_one_voting_start"
    t.date "round_one_voting_end"
    t.datetime "round_two_voting_start"
    t.datetime "round_two_voting_end"
  end

  create_table "pitches", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "pitchers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nickname"
    t.string "name"
    t.string "email"
    t.string "uid"
    t.string "provider"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cohort_id"
    t.index ["cohort_id"], name: "index_users_on_cohort_id"
  end

  create_table "valid_users", force: :cascade do |t|
    t.text "nickname"
    t.bigint "cohort_id"
    t.index ["cohort_id"], name: "index_valid_users_on_cohort_id"
  end

  add_foreign_key "users", "cohorts"
  add_foreign_key "valid_users", "cohorts"
end
