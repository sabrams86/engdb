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

ActiveRecord::Schema.define(:version => 20131205144246) do

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0, :null => false
    t.integer  "attempts",   :default => 0, :null => false
    t.text     "handler",                   :null => false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

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
    t.boolean  "status"
    t.string   "user_name"
    t.text     "comments"
  end

  create_table "email_lists", :force => true do |t|
    t.string   "department"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "engineering_procedures", :force => true do |t|
    t.string   "procedure_number"
    t.string   "title"
    t.text     "description"
    t.date     "created_on"
    t.string   "created_by"
    t.text     "comments"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "engineering_projects", :force => true do |t|
    t.integer  "project_number"
    t.date     "created_on"
    t.string   "project_engineer"
    t.string   "title"
    t.text     "description"
    t.string   "status"
    t.string   "file_location"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "request_items", :force => true do |t|
    t.string   "part_number"
    t.string   "item_number"
    t.string   "part_desc"
    t.string   "reference_part"
    t.string   "mfg_lead"
    t.integer  "mfg_labor"
    t.integer  "mfg_matl"
    t.text     "mfg_comments"
    t.string   "eng_lead"
    t.integer  "eng_hours"
    t.string   "make_from"
    t.string   "eng_status"
    t.text     "eng_comments"
    t.integer  "purch_cost"
    t.integer  "acct_price"
    t.integer  "final_price"
    t.string   "final_lead"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "request_id"
  end

  create_table "requests", :force => true do |t|
    t.integer  "request_number"
    t.string   "requester"
    t.string   "regional_sales_mgr"
    t.string   "rep"
    t.string   "quote_number"
    t.string   "order_number"
    t.string   "customer"
    t.string   "cusomter_location"
    t.string   "product_line"
    t.date     "inq_submitted_date"
    t.date     "order_submitted_date"
    t.string   "rev_level"
    t.text     "description"
    t.string   "status"
    t.text     "comments"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
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
    t.string   "drawing_number"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "email"
    t.string   "title"
    t.string   "department"
  end

end
