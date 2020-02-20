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

ActiveRecord::Schema.define(version: 2020_02_20_163058) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id", null: false
    t.bigint "showerthought_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["showerthought_id"], name: "index_comments_on_showerthought_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "showerthoughts", force: :cascade do |t|
    t.string "content"
    t.string "context"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_showerthoughts_on_user_id"
  end

  create_table "taggeds", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "showerthought_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["showerthought_id"], name: "index_taggeds_on_showerthought_id"
    t.index ["tag_id"], name: "index_taggeds_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "uses"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "thumbs", force: :cascade do |t|
    t.boolean "direction"
    t.bigint "user_id", null: false
    t.bigint "showerthought_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["showerthought_id"], name: "index_thumbs_on_showerthought_id"
    t.index ["user_id"], name: "index_thumbs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "profile_pic"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "comments", "showerthoughts"
  add_foreign_key "comments", "users"
  add_foreign_key "showerthoughts", "users"
  add_foreign_key "taggeds", "showerthoughts"
  add_foreign_key "taggeds", "tags"
  add_foreign_key "thumbs", "showerthoughts"
  add_foreign_key "thumbs", "users"
end
