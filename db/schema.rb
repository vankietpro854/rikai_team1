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


ActiveRecord::Schema.define(version: 2019_07_11_072135) do

  create_table "chapters", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cour_id"
    t.index ["cour_id"], name: "index_chapters_on_cour_id"
    t.integer "course_id"
    t.string "chapter_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cours", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content"
    t.integer "time_learn"
    t.string "image_cours"
  end

  create_table "detail_courses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "cour_id"
    t.date "begin"
    t.date "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cour_id"], name: "index_detail_courses_on_cour_id"
    t.index ["user_id"], name: "index_detail_courses_on_user_id"
  end

  create_table "reports", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "image"
    t.integer "phone"
    t.datetime "date"
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
  end

  add_foreign_key "chapters", "cours"
  add_foreign_key "detail_courses", "cours"
  add_foreign_key "detail_courses", "users"
  add_foreign_key "reports", "users"
end
