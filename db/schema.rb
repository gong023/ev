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

ActiveRecord::Schema.define(version: 20140605145438) do

  create_table "lifelog_animeticks", force: true do |t|
    t.integer  "evernote_uid",              null: false
    t.string   "access_token",              null: false
    t.string   "access_secret",             null: false
    t.integer  "status",        default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lifelog_animeticks", ["evernote_uid", "status"], name: "index_lifelog_animeticks_on_evernote_uid_and_status", using: :btree
  add_index "lifelog_animeticks", ["evernote_uid"], name: "index_lifelog_animeticks_on_evernote_uid", unique: true, using: :btree

  create_table "lifelog_evernotes", force: true do |t|
    t.integer  "uid",                               null: false
    t.string   "access_secret",                     null: false
    t.string   "notebook",      default: "lifelog"
    t.integer  "status",        default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lifelog_evernotes", ["uid", "status"], name: "index_lifelog_evernotes_on_uid_and_status", using: :btree
  add_index "lifelog_evernotes", ["uid"], name: "index_lifelog_evernotes_on_uid", unique: true, using: :btree

  create_table "lifelog_githubs", force: true do |t|
    t.integer  "evernote_uid",              null: false
    t.string   "access_secret",             null: false
    t.integer  "status",        default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lifelog_githubs", ["evernote_uid", "status"], name: "index_githubs_on_evernote_uid_and_status", using: :btree
  add_index "lifelog_githubs", ["evernote_uid"], name: "index_githubs_on_evernote_uid", unique: true, using: :btree

  create_table "lifelog_hatenas", force: true do |t|
    t.integer  "evernote_uid",              null: false
    t.string   "access_token",              null: false
    t.string   "access_secret",             null: false
    t.integer  "status",        default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lifelog_hatenas", ["evernote_uid", "status"], name: "index_lifelog_hatenas_on_evernote_uid_and_status", using: :btree
  add_index "lifelog_hatenas", ["evernote_uid"], name: "index_lifelog_hatenas_on_evernote_uid", unique: true, using: :btree

  create_table "lifelog_loggers", force: true do |t|
    t.integer  "evernote_uid"
    t.text     "text"
    t.string   "occured"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lifelog_loggers", ["evernote_uid"], name: "index_lifelog_loggers_on_evernote_uid", using: :btree
  add_index "lifelog_loggers", ["occured"], name: "index_lifelog_loggers_on_occured", using: :btree

  create_table "lifelog_moves", force: true do |t|
    t.integer  "evernote_uid",              null: false
    t.string   "access_secret",             null: false
    t.integer  "status",        default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lifelog_moves", ["evernote_uid", "status"], name: "index_lifelog_moves_on_evernote_uid_and_status", using: :btree
  add_index "lifelog_moves", ["evernote_uid"], name: "index_lifelog_moves_on_evernote_uid", unique: true, using: :btree

  create_table "lifelog_twitters", force: true do |t|
    t.integer  "evernote_uid",              null: false
    t.string   "access_token",              null: false
    t.string   "access_secret",             null: false
    t.integer  "status",        default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lifelog_twitters", ["evernote_uid", "status"], name: "index_lifelog_twitters_on_evernote_uid_and_status", using: :btree
  add_index "lifelog_twitters", ["evernote_uid"], name: "index_lifelog_twitters_on_evernote_uid", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.integer  "evernote_uid",             null: false
    t.integer  "status",       default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["evernote_uid", "status"], name: "index_users_on_evernote_uid_and_status", using: :btree
  add_index "users", ["evernote_uid"], name: "index_users_on_evernote_uid", unique: true, using: :btree

  create_table "workers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "evernote_uid", null: false
  end

end
