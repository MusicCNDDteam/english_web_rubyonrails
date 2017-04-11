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

ActiveRecord::Schema.define(version: 20170402151049) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "author_id"
    t.integer  "category_id"
  end

  create_table "microposts", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
  end

  create_table "quiz_answers", force: :cascade do |t|
    t.string   "content"
    t.boolean  "correct"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "quiz_question_id"
  end

  create_table "quiz_questions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "question_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "topic_id"
  end

  create_table "registrations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "course_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  create_table "words", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "content"
    t.integer  "topic_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
