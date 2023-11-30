# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_11_29_104705) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.text "content"
    t.bigint "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "occasion_id", null: false
    t.bigint "user_id", null: false
    t.integer "myoccasion"
    t.integer "recipient"
    t.integer "gift"
    t.integer "user"
    t.jsonb "favorites"
    t.jsonb "hobbies"
    t.jsonb "activities"
    t.jsonb "channels"
    t.text "contents", array: true
    t.text "brands", array: true
    t.text "places", array: true
    t.text "socials", array: true
    t.text "onlines", array: true
    t.text "purchases", array: true
    t.text "communications", array: true
    t.text "apps", array: true
    t.text "websites", array: true
    t.text "locations", array: true
    t.text "devices", array: true
    t.text "softwares", array: true
    t.text "games", array: true
    t.text "platforms", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["occasion_id"], name: "index_favorites_on_occasion_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "gift_categories", force: :cascade do |t|
    t.string "name"
    t.text "categories"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gifts", force: :cascade do |t|
    t.jsonb "div"
    t.integer "price"
    t.string "occasion"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mycontacts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "contacts", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_mycontacts_on_user_id"
  end

  create_table "myoccasions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "groups", array: true
    t.integer "recipient"
    t.integer "gift"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_myoccasions_on_user_id"
  end

  create_table "occasions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "myoccasion_id", null: false
    t.integer "recipient"
    t.integer "gift"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["myoccasion_id"], name: "index_occasions_on_myoccasion_id"
    t.index ["user_id"], name: "index_occasions_on_user_id"
  end

  create_table "personnals", force: :cascade do |t|
    t.string "name"
    t.date "birthday"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_personnals_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "description"
    t.decimal "price"
    t.float "rating"
    t.bigint "proposal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proposal_id"], name: "index_products_on_proposal_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "occasion_id", null: false
    t.bigint "user_id", null: false
    t.integer "myoccasion"
    t.integer "recipient"
    t.integer "gift"
    t.integer "user"
    t.jsonb "favorites"
    t.jsonb "hobbies", array: true
    t.jsonb "activities", array: true
    t.jsonb "channels", array: true
    t.text "contents", array: true
    t.text "brands", array: true
    t.text "places", array: true
    t.text "socials", array: true
    t.text "onlines", array: true
    t.text "purchases", array: true
    t.text "communications", array: true
    t.text "apps", array: true
    t.text "websites", array: true
    t.text "locations", array: true
    t.text "devices", array: true
    t.text "softwares", array: true
    t.text "games", array: true
    t.text "platforms", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["occasion_id"], name: "index_profiles_on_occasion_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_proposals_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_answers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "question_id", null: false
    t.bigint "answer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_user_answers_on_answer_id"
    t.index ["question_id"], name: "index_user_answers_on_question_id"
    t.index ["user_id"], name: "index_user_answers_on_user_id"
  end

  create_table "user_contacts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_contacts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "answers", "questions"
  add_foreign_key "favorites", "occasions"
  add_foreign_key "favorites", "users"
  add_foreign_key "mycontacts", "users"
  add_foreign_key "myoccasions", "users"
  add_foreign_key "occasions", "myoccasions"
  add_foreign_key "occasions", "users"
  add_foreign_key "personnals", "users"
  add_foreign_key "products", "proposals"
  add_foreign_key "profiles", "occasions"
  add_foreign_key "profiles", "users"
  add_foreign_key "proposals", "users"
  add_foreign_key "user_answers", "answers"
  add_foreign_key "user_answers", "questions"
  add_foreign_key "user_answers", "users"
  add_foreign_key "user_contacts", "users"
end
