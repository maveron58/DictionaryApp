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
    t.string "name"
  end

  create_table "words", force: true do |t|
    t.string  "word"
    t.string  "definition"
    t.integer "from_id"
    t.integer "to_id"
  end

  add_index "words", ["from_id"], name: "words_from_id_fk", using: :btree
  add_index "words", ["to_id"], name: "words_to_id_fk", using: :btree

  add_foreign_key "words", "languages", :name => "words_from_id_fk", :column => "from_id"
  add_foreign_key "words", "languages", :name => "words_to_id_fk", :column => "to_id"

end
