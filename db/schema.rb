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

ActiveRecord::Schema[7.0].define(version: 2023_08_01_020022) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: :cascade do |t|
    t.integer "bill_id"
    t.string "bill_number"
    t.string "text_url"
    t.string "last_action_date"
    t.string "last_action"
    t.string "title"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.text "sponsors"
    t.text "texts"
    t.string "description"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "abbv_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_bills", force: :cascade do |t|
    t.bigint "bill_id", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_user_bills_on_bill_id"
    t.index ["user_id"], name: "index_user_bills_on_user_id"
  end

  create_table "user_categories", force: :cascade do |t|
    t.integer "user_id"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_user_categories_on_category_id"
    t.index ["user_id"], name: "index_user_categories_on_user_id"
  end

  create_table "user_states", force: :cascade do |t|
    t.bigint "state_id", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_user_states_on_state_id"
    t.index ["user_id"], name: "index_user_states_on_user_id"
  end

  add_foreign_key "user_bills", "bills"
  add_foreign_key "user_categories", "categories"
  add_foreign_key "user_states", "states"
end
