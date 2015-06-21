# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150619204734) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "possible_answers", force: :cascade do |t|
    t.integer  "question_id"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "possible_answers", ["question_id"], name: "index_possible_answers_on_question_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.integer  "survey_id"
    t.text     "prompt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "questions", ["survey_id"], name: "index_questions_on_survey_id", using: :btree

  create_table "submissions", force: :cascade do |t|
    t.integer  "survey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "submissions", ["survey_id"], name: "index_submissions_on_survey_id", using: :btree

  create_table "surveys", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "surveys", ["user_id"], name: "index_surveys_on_user_id", using: :btree

  create_table "user_answers", force: :cascade do |t|
    t.integer  "submission_id"
    t.integer  "question_id"
    t.string   "value"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "user_answers", ["question_id"], name: "index_user_answers_on_question_id", using: :btree
  add_index "user_answers", ["submission_id"], name: "index_user_answers_on_submission_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "possible_answers", "questions"
  add_foreign_key "questions", "surveys"
  add_foreign_key "submissions", "surveys"
  add_foreign_key "surveys", "users"
  add_foreign_key "user_answers", "questions"
  add_foreign_key "user_answers", "submissions"
end
