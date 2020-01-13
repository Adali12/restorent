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

ActiveRecord::Schema.define(version: 2020_01_13_192346) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "break_fasts", force: :cascade do |t|
    t.string "item"
    t.integer "price"
    t.bigint "resto_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resto_id"], name: "index_break_fasts_on_resto_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "resto_id", null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resto_id"], name: "index_comments_on_resto_id"
  end

  create_table "lunches", force: :cascade do |t|
    t.string "item"
    t.integer "price"
    t.bigint "resto_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resto_id"], name: "index_lunches_on_resto_id"
  end

  create_table "restos", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "details"
    t.text "image"
    t.string "website"
    t.boolean "online_delivery", default: false
    t.boolean "table_booking", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "break_fasts", "restos"
  add_foreign_key "comments", "restos"
  add_foreign_key "lunches", "restos"
end
