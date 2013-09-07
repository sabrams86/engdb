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

ActiveRecord::Schema.define(:version => 20130907035850) do

  create_table "drawings", :force => true do |t|
    t.string   "drawing_number"
    t.string   "item_number"
    t.string   "description"
    t.string   "pump_model"
    t.string   "frame_size"
    t.date     "created_on"
    t.string   "make_from"
    t.string   "file_format"
    t.string   "file_location"
    t.string   "part_type"
    t.text     "comments"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "ecns", :force => true do |t|
    t.integer  "ecn_number"
    t.string   "ecn_type"
    t.string   "product_line"
    t.date     "created_on"
    t.boolean  "distribute_engineering"
    t.boolean  "distribute_purchasing"
    t.boolean  "distribute_planning"
    t.boolean  "distribute_manufacturing"
    t.boolean  "distribute_qantel"
    t.boolean  "distribute_sales"
    t.boolean  "distribute_inventory"
    t.boolean  "distribute_quality"
    t.boolean  "distribute_india"
    t.boolean  "distribute_finance"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "revisions", :force => true do |t|
    t.text     "change"
    t.text     "justification"
    t.string   "rev_level"
    t.string   "disposition_wip"
    t.string   "disposition_inventory"
    t.integer  "quantity_in_qantel"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "ecn_id"
    t.integer  "drawing_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
