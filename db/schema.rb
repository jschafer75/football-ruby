# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_28_040932) do

  create_table "facilities", force: :cascade do |t|
    t.integer "franchise_id"
    t.integer "available_space", default: 0
    t.integer "medical", default: 0
    t.integer "practice", default: 0
    t.integer "scouting", default: 0
    t.integer "meeting", default: 0
    t.integer "research", default: 0
    t.integer "technology", default: 0
    t.integer "locker", default: 0
    t.integer "dining", default: 0
    t.integer "espionage", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["franchise_id"], name: "index_facilities_on_franchise_id"
  end

  create_table "franchises", force: :cascade do |t|
    t.string "city"
    t.string "mascot"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "rating", default: 70
    t.string "primary_color", default: "#000000"
    t.string "secondary_color", default: "#FFFFFF"
    t.integer "league_id"
    t.index ["league_id"], name: "index_franchises_on_league_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "home_team_id"
    t.integer "away_team_id"
    t.integer "home_score"
    t.integer "away_score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "year"
    t.integer "week"
    t.integer "league_id"
    t.index ["away_team_id"], name: "index_games_on_away_team_id"
    t.index ["home_team_id"], name: "index_games_on_home_team_id"
    t.index ["league_id"], name: "index_games_on_league_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "year", default: 2020
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "position"
    t.string "role", default: "player"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "franchise_id"
    t.index ["franchise_id"], name: "index_people_on_franchise_id"
  end

  create_table "stadia", force: :cascade do |t|
    t.integer "franchise_id"
    t.integer "size", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["franchise_id"], name: "index_stadia_on_franchise_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "superadmin_role", default: false
    t.boolean "supervisor_role", default: false
    t.boolean "user_role", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "franchises", "leagues"
  add_foreign_key "games", "franchises", column: "away_team_id"
  add_foreign_key "games", "franchises", column: "home_team_id"
  add_foreign_key "people", "franchises"
end
