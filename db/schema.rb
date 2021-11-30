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

ActiveRecord::Schema.define(version: 2021_11_29_155118) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "garden_kits", force: :cascade do |t|
    t.string "kit_name"
    t.bigint "my_garden_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "kit_url"
    t.string "price"
    t.string "description"
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
    t.string "my_garden_name"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "garden_kits", "my_gardens"
  add_foreign_key "kit_plants", "garden_kits"
  add_foreign_key "kit_plants", "plants"
  add_foreign_key "my_gardens", "users"
  add_foreign_key "my_plants", "my_gardens"
  add_foreign_key "my_plants", "plants"
end
