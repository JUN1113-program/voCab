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

ActiveRecord::Schema.define(version: 2019_10_13_163943) do

  create_table "favorites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "wordbook_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_favorites_on_user_id"
    t.index ["wordbook_id"], name: "index_favorites_on_wordbook_id"
  end

  create_table "forgettingcurves", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "tenminutes", null: false
    t.integer "onehour", null: false
    t.integer "oneday", null: false
    t.integer "type", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_forgettingcurves_on_user_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "image", null: false
    t.bigint "word_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["word_id"], name: "index_images_on_word_id"
  end

  create_table "questions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "test_id"
    t.bigint "word_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_id"], name: "index_questions_on_test_id"
    t.index ["word_id"], name: "index_questions_on_word_id"
  end

  create_table "selections", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "testword_id"
    t.bigint "testresult_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["testresult_id"], name: "index_selections_on_testresult_id"
    t.index ["testword_id"], name: "index_selections_on_testword_id"
  end

  create_table "tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "entry", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "testresults", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "score", null: false
    t.bigint "user_id"
    t.bigint "test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_id"], name: "index_testresults_on_test_id"
    t.index ["user_id"], name: "index_testresults_on_user_id"
  end

  create_table "tests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "wordbook_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wordbook_id"], name: "index_tests_on_wordbook_id"
  end

  create_table "testwords", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "word", null: false
    t.integer "correct", null: false
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_testwords_on_question_id"
  end

  create_table "user_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_user_tags_on_tag_id"
    t.index ["user_id"], name: "index_user_tags_on_user_id"
  end

  create_table "user_wordbooks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "wordbook_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_wordbooks_on_user_id"
    t.index ["wordbook_id"], name: "index_user_wordbooks_on_wordbook_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wordbook_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "wordbook_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_wordbook_tags_on_tag_id"
    t.index ["wordbook_id"], name: "index_wordbook_tags_on_wordbook_id"
  end

  create_table "wordbooks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.integer "viewed", null: false
    t.boolean "share", null: false
    t.string "reference"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wordbooks_on_user_id"
  end

  create_table "words", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "front", null: false
    t.string "reverse", null: false
    t.bigint "wordbook_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wordbook_id"], name: "index_words_on_wordbook_id"
  end

  add_foreign_key "favorites", "users"
  add_foreign_key "favorites", "wordbooks"
  add_foreign_key "forgettingcurves", "users"
  add_foreign_key "images", "words"
  add_foreign_key "questions", "tests"
  add_foreign_key "questions", "words"
  add_foreign_key "selections", "testresults"
  add_foreign_key "selections", "testwords"
  add_foreign_key "testresults", "tests"
  add_foreign_key "testresults", "users"
  add_foreign_key "tests", "wordbooks"
  add_foreign_key "testwords", "questions"
  add_foreign_key "user_tags", "tags"
  add_foreign_key "user_tags", "users"
  add_foreign_key "user_wordbooks", "users"
  add_foreign_key "user_wordbooks", "wordbooks"
  add_foreign_key "wordbook_tags", "tags"
  add_foreign_key "wordbook_tags", "wordbooks"
  add_foreign_key "wordbooks", "users"
  add_foreign_key "words", "wordbooks"
end
