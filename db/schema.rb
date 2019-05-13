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

ActiveRecord::Schema.define(version: 2019_05_13_002550) do

  create_table "choruses", force: :cascade do |t|
    t.string "name"
    t.integer "type_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "singer_id"
    t.integer "chorus_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "section_leader"
    t.boolean "baritone"
    t.boolean "bass"
    t.boolean "lead"
    t.boolean "tenor"
  end

  create_table "singers", force: :cascade do |t|
    t.text "name"
    t.text "preferred_voice_part"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.integer "singer_id"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
