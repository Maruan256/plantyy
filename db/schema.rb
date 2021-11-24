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

ActiveRecord::Schema.define(version: 2021_11_24_140226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "garden_kits", force: :cascade do |t|
    t.string "kit_name"
    t.bigint "my_garden_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "kit_url"
    t.index ["my_garden_id"], name: "index_garden_kits_on_my_garden_id"
  end

  create_table "kit_plants", force: :cascade do |t|
    t.bigint "plant_id", null: false
    t.bigint "garden_kit_id", null: false
    t.index ["garden_kit_id"], name: "index_kit_plants_on_garden_kit_id"
    t.index ["plant_id"], name: "index_kit_plants_on_plant_id"
  end

  create_table "my_gardens", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_my_gardens_on_user_id"
  end

  create_table "my_plants", force: :cascade do |t|
    t.bigint "plant_id", null: false
    t.integer "water_level"
    t.integer "fertilizer_level"
    t.integer "harvest_level"
    t.boolean "bring_in"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active"
    t.bigint "my_garden_id"
    t.index ["my_garden_id"], name: "index_my_plants_on_my_garden_id"
    t.index ["plant_id"], name: "index_my_plants_on_plant_id"
  end

  create_table "plants", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "plant_url"
    t.text "description"
    t.string "sunlight"
    t.string "water"
    t.string "cat"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "garden_kits", "my_gardens"
  add_foreign_key "kit_plants", "garden_kits"
  add_foreign_key "kit_plants", "plants"
  add_foreign_key "my_gardens", "users"
  add_foreign_key "my_plants", "my_gardens"
  add_foreign_key "my_plants", "plants"
end
