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

ActiveRecord::Schema.define(version: 2020_01_26_070216) do

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", default: "2020-01-01 00:00:00"
    t.datetime "updated_at", default: "2020-01-01 00:00:00"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", default: "abe", null: false
    t.text "text"
    t.string "category_id", default: ""
    t.integer "brand_id"
    t.integer "price"
    t.string "product_size"
    t.string "condition"
    t.string "shipping_charge"
    t.string "shipping_method"
    t.string "delivery_area"
    t.integer "user_id", default: 1
    t.datetime "created_at", default: "2020-01-01 23:59:59"
    t.datetime "updated_at", default: "2020-01-01 23:59:59", null: false
    t.string "image", default: "hoge.png"
  end

end
