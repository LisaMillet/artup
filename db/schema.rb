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

ActiveRecord::Schema[7.0].define(version: 2023_03_15_094209) do
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
    t.bigint "question_id", null: false
    t.text "content"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "right_answer", default: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "journey_pieces", force: :cascade do |t|
    t.bigint "journey_id", null: false
    t.bigint "piece_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["journey_id"], name: "index_journey_pieces_on_journey_id"
    t.index ["piece_id"], name: "index_journey_pieces_on_piece_id"
  end

  create_table "journeys", force: :cascade do |t|
    t.integer "discount"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
  end

  create_table "pieces", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "artist"
    t.text "materials_techniques"
    t.string "creation_year"
    t.text "media"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.string "slug"
    t.string "fun_fact_1"
    t.string "fun_fact_2"
    t.string "fun_fact_3"
    t.string "fun_fact_4"
    t.string "fun_fact_5"
    t.string "location"
  end

  create_table "questions", force: :cascade do |t|
    t.text "content"
    t.bigint "piece_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["piece_id"], name: "index_questions_on_piece_id"
  end

  create_table "user_journey_answers", force: :cascade do |t|
    t.bigint "answer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_journey_piece_id", null: false
    t.index ["answer_id"], name: "index_user_journey_answers_on_answer_id"
    t.index ["user_journey_piece_id"], name: "index_user_journey_answers_on_user_journey_piece_id"
  end

  create_table "user_journey_pieces", force: :cascade do |t|
    t.bigint "user_journey_id", null: false
    t.bigint "piece_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.index ["piece_id"], name: "index_user_journey_pieces_on_piece_id"
    t.index ["user_journey_id"], name: "index_user_journey_pieces_on_user_journey_id"
  end

  create_table "user_journeys", force: :cascade do |t|
    t.bigint "journey_id", null: false
    t.bigint "user_id", null: false
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: true
    t.index ["journey_id"], name: "index_user_journeys_on_journey_id"
    t.index ["user_id"], name: "index_user_journeys_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "answers", "questions"
  add_foreign_key "journey_pieces", "journeys"
  add_foreign_key "journey_pieces", "pieces"
  add_foreign_key "questions", "pieces"
  add_foreign_key "user_journey_answers", "answers"
  add_foreign_key "user_journey_answers", "user_journey_pieces"
  add_foreign_key "user_journey_pieces", "pieces"
  add_foreign_key "user_journey_pieces", "user_journeys"
  add_foreign_key "user_journeys", "journeys"
  add_foreign_key "user_journeys", "users"
end
