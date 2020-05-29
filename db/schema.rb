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

ActiveRecord::Schema.define(version: 2020_05_28_120354) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comment_likes", force: :cascade do |t|
    t.bigint "comment_id", null: false
    t.bigint "like_comment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id", "like_comment_id"], name: "index_comment_likes_on_comment_id_and_like_comment_id", unique: true
    t.index ["comment_id"], name: "index_comment_likes_on_comment_id"
    t.index ["like_comment_id"], name: "index_comment_likes_on_like_comment_id"
  end

  create_table "comment_users", force: :cascade do |t|
    t.bigint "comment_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id", "user_id"], name: "index_comment_users_on_comment_id_and_user_id", unique: true
    t.index ["comment_id"], name: "index_comment_users_on_comment_id"
    t.index ["user_id"], name: "index_comment_users_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "body", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "author_type"
    t.bigint "author_id"
    t.bigint "task_id", default: 0, null: false
    t.index ["author_type", "author_id"], name: "index_comments_on_author_type_and_author_id"
    t.index ["task_id"], name: "index_comments_on_task_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "email_registration", null: false
    t.string "email_notification", null: false
    t.string "password_digest", null: false
    t.string "state", null: false
    t.string "phone", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "service_id"
    t.bigint "district_id", default: 1, null: false
    t.bigint "city_id", default: 0, null: false
    t.index ["city_id"], name: "index_companies_on_city_id"
    t.index ["district_id"], name: "index_companies_on_district_id"
    t.index ["email_notification"], name: "index_companies_on_email_notification", unique: true
    t.index ["email_registration"], name: "index_companies_on_email_registration", unique: true
    t.index ["name"], name: "index_companies_on_name", unique: true
    t.index ["phone"], name: "index_companies_on_phone", unique: true
    t.index ["service_id"], name: "index_companies_on_service_id"
  end

  create_table "districts", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "city_id", null: false
    t.index ["city_id"], name: "index_districts_on_city_id"
  end

  create_table "like_comment_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "like_comment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["like_comment_id"], name: "index_like_comment_users_on_like_comment_id"
    t.index ["user_id", "like_comment_id"], name: "index_like_comment_users_on_user_id_and_like_comment_id", unique: true
    t.index ["user_id"], name: "index_like_comment_users_on_user_id"
  end

  create_table "like_comments", force: :cascade do |t|
    t.boolean "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_service_on_name", unique: true
  end

  create_table "task_services", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.bigint "service_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_id"], name: "index_task_services_on_service_id"
    t.index ["task_id", "service_id"], name: "index_task_services_on_task_id_and_service_id", unique: true
    t.index ["task_id"], name: "index_task_services_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "description", null: false
    t.string "title", null: false
    t.string "address", null: false
    t.string "state", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "company_id"
    t.bigint "city_id"
    t.bigint "district_id"
    t.bigint "service_id"
    t.string "state_user"
    t.string "state_company"
    t.index ["city_id"], name: "index_tasks_on_city_id"
    t.index ["company_id"], name: "index_tasks_on_company_id"
    t.index ["district_id"], name: "index_tasks_on_district_id"
    t.index ["service_id"], name: "index_tasks_on_service_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "second_name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "phone", null: false
    t.string "state", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "city_id"
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["phone"], name: "index_users_on_phone", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comment_likes", "comments"
  add_foreign_key "comment_likes", "like_comments"
  add_foreign_key "comment_users", "comments"
  add_foreign_key "comment_users", "users"
  add_foreign_key "comments", "tasks"
  add_foreign_key "companies", "cities"
  add_foreign_key "companies", "districts"
  add_foreign_key "companies", "services"
  add_foreign_key "districts", "cities"
  add_foreign_key "like_comment_users", "like_comments"
  add_foreign_key "like_comment_users", "users"
  add_foreign_key "task_services", "services"
  add_foreign_key "task_services", "tasks"
  add_foreign_key "tasks", "cities"
  add_foreign_key "tasks", "districts"
  add_foreign_key "tasks", "services"
  add_foreign_key "tasks", "users"
  add_foreign_key "users", "cities"
end
