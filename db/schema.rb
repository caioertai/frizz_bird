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

ActiveRecord::Schema.define(version: 20180514151723) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aliases", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "document"
    t.string "synonyms"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ingredients_aliases_id"
    t.bigint "alias_id"
    t.datetime "searched_at"
    t.string "translated_name"
    t.index ["alias_id"], name: "index_ingredients_on_alias_id"
    t.index ["ingredients_aliases_id"], name: "index_ingredients_on_ingredients_aliases_id"
  end

  create_table "item_ingredients", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "ingredient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_item_ingredients_on_ingredient_id"
    t.index ["item_id"], name: "index_item_ingredients_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "path"
    t.string "document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "brand"
    t.string "factory"
  end

  create_table "products", force: :cascade do |t|
    t.integer "price"
    t.string "ean"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "item_id"
    t.string "presentation"
    t.string "path"
    t.string "photo"
    t.integer "price_cents", default: 0, null: false
    t.index ["ean"], name: "index_products_on_ean"
    t.index ["item_id"], name: "index_products_on_item_id"
  end

  create_table "user_admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_user_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_user_admins_on_reset_password_token", unique: true
  end

  add_foreign_key "ingredients", "aliases"
  add_foreign_key "item_ingredients", "ingredients"
  add_foreign_key "item_ingredients", "items"
  add_foreign_key "products", "items"
end
