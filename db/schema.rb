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

ActiveRecord::Schema.define(version: 20181215163454) do

  create_table "evaluations", force: :cascade do |t|
    t.integer "User_id"
    t.integer "Submission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Submission_id"], name: "index_evaluations_on_Submission_id"
    t.index ["User_id"], name: "index_evaluations_on_User_id"
  end

  create_table "genres", force: :cascade do |t|
    t.text "genre"
    t.integer "Subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Subject_id"], name: "index_genres_on_Subject_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "subject"
  end

  create_table "submissions", force: :cascade do |t|
    t.text "title"
    t.text "content"
    t.integer "User_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "evaluation"
    t.integer "Genre_id"
    t.index ["Genre_id"], name: "index_submissions_on_Genre_id"
    t.index ["User_id"], name: "index_submissions_on_User_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "text"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
