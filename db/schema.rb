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

ActiveRecord::Schema.define(version: 20170416062048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "board_setup_games", force: :cascade do |t|
    t.integer "board_setup_id"
    t.integer "game_id"
  end

  create_table "board_setups", force: :cascade do |t|
    t.string   "a1"
    t.string   "b1"
    t.string   "c1"
    t.string   "a2"
    t.string   "b2"
    t.string   "c2"
    t.string   "a3"
    t.string   "b3"
    t.string   "c3"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "chosen_move_id"
  end

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "next_moves", force: :cascade do |t|
    t.integer  "rank"
    t.integer  "board_setup_id"
    t.string   "position"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "value"
  end

end
