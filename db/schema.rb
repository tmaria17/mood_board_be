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

ActiveRecord::Schema.define(version: 2019_02_20_034510) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "affirmations", force: :cascade do |t|
    t.text "affirmation_text"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_affirmations_on_user_id"
  end

  create_table "journal_entries", force: :cascade do |t|
    t.text "entry_text"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_journal_entries_on_user_id"
  end

  create_table "tone_responses", force: :cascade do |t|
    t.string "primary_tone"
    t.string "secondary_tone"
    t.bigint "journal_entry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "primary_score"
    t.decimal "secondary_score"
    t.index ["journal_entry_id"], name: "index_tone_responses_on_journal_entry_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "refresh_token"
  end

  add_foreign_key "affirmations", "users"
  add_foreign_key "journal_entries", "users"
  add_foreign_key "tone_responses", "journal_entries"
end
