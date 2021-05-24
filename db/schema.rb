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

ActiveRecord::Schema.define(version: 2021_05_24_202551) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bill_lines", force: :cascade do |t|
    t.bigint "dish_id", null: false
    t.bigint "bill_id", null: false
    t.integer "quantity"
    t.integer "amount_excluding_tax_cents"
    t.integer "amount_added_value_tax_cents"
    t.string "amount_including_tax_cents"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bill_id"], name: "index_bill_lines_on_bill_id"
    t.index ["dish_id"], name: "index_bill_lines_on_dish_id"
  end

  create_table "bills", force: :cascade do |t|
    t.string "reference"
    t.integer "total_excluding_tax_cents"
    t.integer "total_added_value_tax_cents"
    t.integer "total_including_tax_cents"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dishes", force: :cascade do |t|
    t.bigint "menu_id", null: false
    t.integer "course"
    t.string "name"
    t.integer "price_excluding_tax_cents"
    t.integer "added_value_tax"
    t.integer "amount_added_value_tax_cents"
    t.string "price_including_tax_cents"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["menu_id"], name: "index_dishes_on_menu_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.integer "kind"
    t.integer "unit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "menus", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_menus_on_restaurant_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "source"
    t.integer "amount_cents"
    t.integer "status"
    t.bigint "bill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bill_id"], name: "index_payments_on_bill_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.bigint "dish_id", null: false
    t.bigint "ingredient_id", null: false
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dish_id"], name: "index_recipes_on_dish_id"
    t.index ["ingredient_id"], name: "index_recipes_on_ingredient_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.integer "address_number"
    t.string "address_street"
    t.string "address_complement"
    t.string "address_city"
    t.string "address_zip"
    t.string "address_country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bill_lines", "bills"
  add_foreign_key "bill_lines", "dishes"
  add_foreign_key "dishes", "menus"
  add_foreign_key "menus", "restaurants"
  add_foreign_key "payments", "bills"
  add_foreign_key "recipes", "dishes"
  add_foreign_key "recipes", "ingredients"
end
