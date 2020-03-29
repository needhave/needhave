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

ActiveRecord::Schema.define(version: 2020_03_29_224816) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "entities", force: :cascade do |t|
    t.text "description"
    t.boolean "verified"
    t.boolean "is_corporate"
    t.text "contact_phone"
    t.text "contact_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "have_posts", force: :cascade do |t|
    t.text "description"
    t.text "instructions"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "entity_id"
    t.bigint "location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "display_name"
    t.geography "lonlat", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.jsonb "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address"], name: "index_locations_on_address", using: :gin
  end

  create_table "need_posts", force: :cascade do |t|
    t.text "description"
    t.text "instructions"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "entity_id"
    t.bigint "location_id"
  end

  add_foreign_key "have_posts", "entities"
  add_foreign_key "have_posts", "locations"
  add_foreign_key "need_posts", "entities"
  add_foreign_key "need_posts", "locations"
end
