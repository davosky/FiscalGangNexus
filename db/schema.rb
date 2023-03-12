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

ActiveRecord::Schema[7.0].define(version: 2023_03_12_132152) do
  create_table "categories", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "operators", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "category"
    t.string "phone"
    t.boolean "admin"
    t.boolean "manager"
    t.boolean "regular"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_operators_on_email", unique: true
    t.index ["reset_password_token"], name: "index_operators_on_reset_password_token", unique: true
    t.index ["username"], name: "index_operators_on_username", unique: true
  end

  create_table "practices", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "name"
    t.date "date"
    t.bigint "practice_id"
    t.string "first_name"
    t.string "last_name"
    t.string "mobile"
    t.string "email"
    t.boolean "subscriber"
    t.bigint "category_id"
    t.text "note"
    t.bigint "operator_id"
    t.boolean "processed", default: false
    t.string "updater"
    t.boolean "unprocessable", default: false
    t.string "unprocessable_reason"
    t.boolean "first_call"
    t.boolean "second_call"
    t.boolean "third_call"
    t.date "first_call_date"
    t.date "second_call_date"
    t.date "third_call_date"
    t.string "first_call_updater"
    t.string "second_call_updater"
    t.string "third_call_updater"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_requests_on_category_id"
    t.index ["operator_id"], name: "index_requests_on_operator_id"
    t.index ["practice_id"], name: "index_requests_on_practice_id"
  end

  add_foreign_key "requests", "categories"
  add_foreign_key "requests", "operators"
  add_foreign_key "requests", "practices"
end
