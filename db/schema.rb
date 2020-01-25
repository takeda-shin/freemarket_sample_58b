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


ActiveRecord::Schema.define(version: 2020_01_23_192127) do

  create_table "card_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false
    t.bigint "card_number", null: false
    t.integer "security_code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "use_limit_month", null: false
    t.integer "use_limit_year", null: false
  end
  
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

  create_table "user_addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "postal_code", null: false
    t.integer "prefectures", null: false
    t.string "city", null: false
    t.string "address", null: false
    t.string "building"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "family_name", null: false
    t.string "family_name_kana", null: false
    t.string "first_name", null: false
    t.string "first_name_kana", null: false
    t.string "email", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "phone_number"
    t.string "profile"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "birthday", null: false

    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
