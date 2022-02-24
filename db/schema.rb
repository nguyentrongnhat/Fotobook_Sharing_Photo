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

ActiveRecord::Schema.define(version: 2020_09_04_111841) do

  create_table "albums", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.string "decription"
    t.string "source"
    t.boolean "status", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "count_of_reacts", default: 0
    t.integer "count_of_photos", default: 0
    t.index ["user_id"], name: "index_albums_on_user_id"
  end

  create_table "aps", force: :cascade do |t|
    t.integer "album_id"
    t.integer "photo_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["album_id"], name: "index_aps_on_album_id"
    t.index ["photo_id"], name: "index_aps_on_photo_id"
  end

  create_table "follows", force: :cascade do |t|
    t.integer "user_id"
    t.integer "id_following"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_follows_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.string "decription"
    t.string "source"
    t.boolean "status", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "picture"
    t.integer "count_of_reacts", default: 0
    t.integer "count_of_albums", default: 0
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "reacts", force: :cascade do |t|
    t.integer "user_react"
    t.bigint "reactable_id"
    t.string "reactable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reactable_type", "reactable_id"], name: "index_reacts_on_reactable_type_and_reactable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "pass"
    t.string "pass_confirmation"
    t.string "lastname"
    t.string "firstname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "avatar", default: "none"
    t.integer "count_of_photos", default: 0
    t.integer "count_of_albums", default: 0
    t.integer "count_of_followings", default: 0
    t.boolean "isAdmin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
