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

ActiveRecord::Schema.define(version: 2019_08_15_081154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.string "species"
    t.string "name"
    t.text "description"
    t.boolean "disponibility"
    t.string "photo"
    t.integer "price_per_day"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "owner_id"
    t.float "latitude"
    t.float "longitude"
    t.index ["owner_id"], name: "index_animals_on_owner_id"
  end

  create_table "rents", force: :cascade do |t|
    t.string "status"
    t.integer "total_price"
    t.date "begin_date"
    t.date "end_date"
    t.bigint "animal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "lodger_id"
    t.index ["animal_id"], name: "index_rents_on_animal_id"
    t.index ["lodger_id"], name: "index_rents_on_lodger_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "avatar", default: "https://upload.wikimedia.org/wikipedia/commons/f/f4/User_Avatar_2.png"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "animals", "users", column: "owner_id"
  add_foreign_key "rents", "animals"
  add_foreign_key "rents", "users", column: "lodger_id"
end
