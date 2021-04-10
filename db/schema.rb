# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_07_011036) do

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "letter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["letter_id"], name: "index_favorites_on_letter_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "letters", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "content"
    t.boolean "repliable"
    t.integer "reply_to"
    t.boolean "twitter_attached"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_letters_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "nickname"
    t.string "name"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "favorites", "letters"
  add_foreign_key "favorites", "users"
  add_foreign_key "letters", "users"
end
