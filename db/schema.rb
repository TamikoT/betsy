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

ActiveRecord::Schema.define(version: 20170427203818) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email_address"
    t.string   "mailing_address"
    t.string   "card_name"
    t.date     "card_expiration"
    t.integer  "card_cvv"
    t.integer  "zipcode"
    t.string   "credit_card"
  end

  create_table "product_categories", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "product_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "product_orders", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "quantity"
  end

  create_table "products", force: :cascade do |t|
    t.integer  "stock"
    t.string   "name"
    t.float    "price"
    t.integer  "user_id"
    t.string   "photo"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
  end

  create_table "reviews", force: :cascade do |t|
    t.float    "rating"
    t.string   "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "product_id"
    t.index ["product_id"], name: "index_reviews_on_product_id", using: :btree
  end

  create_table "user_orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "oauth_uid"
    t.string   "oauth_provider"
  end

  add_foreign_key "reviews", "products"
end
