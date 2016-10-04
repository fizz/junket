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

ActiveRecord::Schema.define(version: 20161004020025) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # These are custom enum types that must be created before they can be used in the schema definition
  create_enum :role, :guest, :host, :admin, :vip


  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "attempts",   default: 0, null: false
    t.datetime "created_at"
    t.datetime "failed_at"
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "locked_at"
    t.string   "locked_by"
    t.integer  "priority",   default: 0, null: false
    t.string   "queue"
    t.datetime "run_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "hotels", force: :cascade do |t|
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at",             null: false
    t.text     "description"
    t.string   "hotel_pic_content_type"
    t.string   "hotel_pic_file_name"
    t.integer  "hotel_pic_file_size"
    t.datetime "hotel_pic_updated_at"
    t.string   "name"
    t.string   "region"
    t.integer  "rooms_id"
    t.datetime "updated_at",             null: false
    t.integer  "user_id"
    t.string   "zip_code"
    t.index ["rooms_id"], name: "index_hotels_on_rooms_id", using: :btree
    t.index ["user_id"], name: "index_hotels_on_user_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.text     "bio"
    t.datetime "created_at",               null: false
    t.string   "profile_pic_content_type"
    t.string   "profile_pic_file_name"
    t.integer  "profile_pic_file_size"
    t.datetime "profile_pic_updated_at"
    t.datetime "updated_at",               null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "room_types", force: :cascade do |t|
    t.integer  "capacity"
    t.datetime "created_at", null: false
    t.string   "name"
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.integer  "hotel_id"
    t.string   "name"
    t.integer  "number"
    t.integer  "price_in_cents"
    t.integer  "room_type_id"
    t.datetime "updated_at",     null: false
    t.index ["hotel_id"], name: "index_rooms_on_hotel_id", using: :btree
    t.index ["room_type_id"], name: "index_rooms_on_room_type_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "current_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.datetime "last_sign_in_at"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string   "reset_password_token"
    t.column   "role", :role
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "versions", force: :cascade do |t|
    t.datetime "created_at"
    t.string   "event",      null: false
    t.integer  "item_id",    null: false
    t.string   "item_type",  null: false
    t.text     "object"
    t.string   "whodunnit"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  end

  add_foreign_key "hotels", "rooms", column: "rooms_id"
  add_foreign_key "hotels", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "rooms", "hotels"
  add_foreign_key "rooms", "room_types"
end
