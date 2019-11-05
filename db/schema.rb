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

ActiveRecord::Schema.define(version: 20191104082311) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "postal_code"
    t.integer  "prefecture_id"
    t.string   "block"
    t.string   "building"
    t.string   "phone"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "city"
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",          null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name_alphabet"
    t.string   "name_kana"
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.integer  "size_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ancestry"
    t.integer  "brand"
    t.index ["ancestry"], name: "index_categories_on_ancestry", using: :btree
    t.index ["size_id"], name: "index_categories_on_size_id", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "comment",         limit: 65535, null: false
    t.integer  "display_item_id",               null: false
    t.integer  "user_id",                       null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["display_item_id"], name: "index_comments_on_display_item_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "display_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                 null: false
    t.text     "description",            limit: 65535, null: false
    t.integer  "price",                                null: false
    t.integer  "category_id"
    t.integer  "size_id"
    t.integer  "brand_id"
    t.integer  "condition_id",                         null: false
    t.integer  "delivery_fee_burden_id",               null: false
    t.integer  "delivery_method_id",                   null: false
    t.integer  "prefecture_id",                        null: false
    t.integer  "delivery_by_day_id",                   null: false
    t.integer  "user_id",                              null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["brand_id"], name: "index_display_items_on_brand_id", using: :btree
    t.index ["category_id"], name: "index_display_items_on_category_id", using: :btree
    t.index ["name"], name: "index_display_items_on_name", using: :btree
    t.index ["size_id"], name: "index_display_items_on_size_id", using: :btree
    t.index ["user_id"], name: "index_display_items_on_user_id", using: :btree
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "image",           null: false
    t.integer  "display_item_id", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["display_item_id"], name: "index_images_on_display_item_id", using: :btree
  end

  create_table "sizes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "size",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ancestry"
    t.index ["ancestry"], name: "index_sizes_on_ancestry", using: :btree
  end

  create_table "user_profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "family_name",                    null: false
    t.string   "last_name",                      null: false
    t.string   "family_name_kana",               null: false
    t.string   "last_name_kana",                 null: false
    t.text     "introduction",     limit: 65535
    t.integer  "birth_year",                     null: false
    t.integer  "birth_month",                    null: false
    t.integer  "birth_day",                      null: false
    t.text     "icon_image",       limit: 65535
    t.integer  "total_sales"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "nickname"
    t.index ["user_id"], name: "index_user_profiles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "phone",                               null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "categories", "sizes"
  add_foreign_key "comments", "display_items"
  add_foreign_key "comments", "users"
  add_foreign_key "display_items", "brands"
  add_foreign_key "display_items", "categories"
  add_foreign_key "display_items", "sizes"
  add_foreign_key "display_items", "users"
  add_foreign_key "images", "display_items"
  add_foreign_key "user_profiles", "users"
end
