# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140925081142) do

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.string   "social_id"
    t.string   "social_issue_place"
    t.string   "social_issue_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "console_games", force: true do |t|
    t.integer  "console_id"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "console_games", ["console_id"], name: "index_console_games_on_console_id", using: :btree
  add_index "console_games", ["game_id"], name: "index_console_games_on_game_id", using: :btree

  create_table "consoles", force: true do |t|
    t.integer  "product_id"
    t.string   "name"
    t.string   "slug"
    t.boolean  "available",  default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "consoles", ["product_id"], name: "index_consoles_on_product_id", using: :btree

  create_table "contract_inventory_items", force: true do |t|
    t.integer  "contract_id"
    t.integer  "inventory_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contract_inventory_items", ["contract_id"], name: "index_contract_inventory_items_on_contract_id", using: :btree
  add_index "contract_inventory_items", ["inventory_item_id"], name: "index_contract_inventory_items_on_inventory_item_id", using: :btree

  create_table "contract_items", force: true do |t|
    t.integer  "contract_id"
    t.integer  "product_id"
    t.integer  "price"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contract_items", ["contract_id"], name: "index_contract_items_on_contract_id", using: :btree
  add_index "contract_items", ["product_id"], name: "index_contract_items_on_product_id", using: :btree

  create_table "contracts", force: true do |t|
    t.integer  "client_id"
    t.integer  "duration"
    t.date     "delivery_date"
    t.date     "complete_date"
    t.string   "number"
    t.integer  "total"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ship"
    t.integer  "console_id"
  end

  add_index "contracts", ["client_id"], name: "index_contracts_on_client_id", using: :btree

  create_table "games", force: true do |t|
    t.string   "name"
    t.string   "poster"
    t.string   "psn_link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "disc",       default: false
  end

  create_table "inventory_items", force: true do |t|
    t.string   "name"
    t.string   "serial"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "long_name"
    t.string   "slug"
    t.integer  "rental_price"
    t.integer  "selling_price"
    t.integer  "deposit_price"
    t.integer  "sales_price"
    t.string   "product_photo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pack1_price"
    t.integer  "pack2_price"
    t.integer  "pack3_price"
    t.boolean  "sellable",      default: false
    t.string   "sell_name"
  end

  create_table "quotes", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.integer  "duration"
    t.integer  "console_id"
    t.text     "note"
    t.string   "state",      default: "pending"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quotes", ["console_id"], name: "index_quotes_on_console_id", using: :btree

  create_table "shippings", force: true do |t|
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",            null: false
    t.string   "crypted_password", null: false
    t.string   "salt",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
