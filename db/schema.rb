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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130407194115) do

  create_table "journals", :force => true do |t|
    t.boolean  "meeting"
    t.string   "title"
    t.date     "event_date"
    t.time     "begin_time"
    t.time     "end_time"
    t.string   "attendees"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "project_id"
    t.integer  "user_id"
  end

  create_table "projects", :force => true do |t|
    t.datetime "time"
    t.string   "title"
    t.text     "description"
    t.text     "common_knowledge"
    t.integer  "parent"
    t.date     "due_date"
    t.decimal  "budget"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "user_id"
  end

  create_table "tasks", :force => true do |t|
    t.boolean  "priority"
    t.boolean  "active"
    t.boolean  "complete"
    t.string   "description"
    t.datetime "due_date"
    t.string   "contact"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "journal_id"
    t.integer  "project_id"
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.boolean  "premium"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "displayname"
  end

end
