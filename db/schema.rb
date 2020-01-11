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

ActiveRecord::Schema.define(version: 2020_01_04_114305) do

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", default: "abe", null: false
    t.text "text", null: false
    t.string "category_id", null: false
    t.integer "brand_id"
    t.integer "price", null: false
    t.string "product_size"
    t.string "condition", null: false
    t.string "shipping_charge"
    t.string "shipping_method"
    t.string "delivery_area", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", default: "2020-01-01 23:59:59", null: false
    t.datetime "updated_at", default: "2020-01-01 23:59:59", null: false
    t.string "image", default: "hoge.png"
  end

end
