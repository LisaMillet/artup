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

ActiveRecord::Schema[7.0].define(version: 2023_03_06_170138) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
  end

  create_table "pieces", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "artist"
    t.text "materials_techniques"
    t.integer "creation_year"
    t.text "media"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text "content"
    t.bigint "piece_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["piece_id"], name: "index_questions_on_piece_id"
  end

  create_table "user_answers", force: :cascade do |t|
    t.bigint "answer_id", null: false
    t.bigint "user_journey_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_user_answers_on_answer_id"
    t.index ["user_journey_id"], name: "index_user_answers_on_user_journey_id"
  end

  create_table "user_journeys", force: :cascade do |t|
    t.bigint "journey_id", null: false
    t.bigint "user_id", null: false
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["journey_id"], name: "index_user_journeys_on_journey_id"
    t.index ["user_id"], name: "index_user_journeys_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email_address"
    t.string "encrypted_password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "journey_pieces", "journeys"
  add_foreign_key "journey_pieces", "pieces"
  add_foreign_key "questions", "pieces"
  add_foreign_key "user_answers", "answers"
  add_foreign_key "user_answers", "user_journeys"
  add_foreign_key "user_journeys", "journeys"
  add_foreign_key "user_journeys", "users"
end
