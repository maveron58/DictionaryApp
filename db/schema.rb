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

ActiveRecord::Schema.define(version: 20130527103415) do

  create_table "languages", force: true do |t|
    t.string  "name",                 null: false
    t.boolean "from", default: false, null: false
    t.boolean "to",   default: false, null: false
  end

  add_index "languages", ["name"], name: "index_languages_on_name", unique: true, using: :btree

  create_table "words", force: true do |t|
    t.string  "word",       null: false
    t.text    "definition", null: false
    t.integer "from_id",    null: false
    t.integer "to_id",      null: false
  end

  add_index "words", ["from_id"], name: "words_from_id_fk", using: :btree
  add_index "words", ["to_id"], name: "words_to_id_fk", using: :btree
  add_index "words", ["word"], name: "index_words_on_word", using: :btree

  add_foreign_key "words", "languages", :name => "words_from_id_fk", :column => "from_id"
  add_foreign_key "words", "languages", :name => "words_to_id_fk", :column => "to_id"

end
