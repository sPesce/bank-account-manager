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

ActiveRecord::Schema.define(version: 2020_07_07_181444) do

  create_table "banks", force: :cascade do |t|
    t.string "name"
    t.string "web_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "routing_number"
  end

  create_table "deposit_accounts", force: :cascade do |t|
    t.integer "online_banking_account_id"
    t.string "category"
    t.decimal "balance"
    t.date "closed_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "account_number"
  end

  create_table "loans", force: :cascade do |t|
    t.integer "online_banking_account_id"
    t.string "category"
    t.decimal "intrest_rate"
    t.date "due_date"
    t.decimal "monthly_charge"
    t.decimal "balance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "closed_date"
  end

  create_table "online_banking_accounts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "bank_id"
    t.string "username"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
  end

end
