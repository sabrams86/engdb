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

ActiveRecord::Schema.define(:version => 20150423170637) do

  create_table "bulletin_files", :force => true do |t|
    t.integer  "product_bulletin_id"
    t.string   "file"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "capa_files", :force => true do |t|
    t.integer  "capa_id"
    t.string   "file"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "capas", :force => true do |t|
    t.string   "capa_number"
    t.string   "pump_model"
    t.string   "item_number"
    t.string   "name"
    t.date     "date"
    t.string   "department"
    t.text     "description"
    t.string   "engineer"
    t.text     "quality_comments"
    t.string   "ncr"
    t.text     "engr_comments"
    t.string   "root"
    t.string   "cause"
    t.string   "suggested"
    t.text     "solution"
    t.date     "date_assigned"
    t.date     "date_resolved"
    t.date     "date_closed"
    t.string   "status"
    t.text     "follow_up_actions"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "serial_no"
  end

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

  create_table "forem_categories", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  add_index "forem_categories", ["slug"], :name => "index_forem_categories_on_slug", :unique => true

  create_table "forem_forums", :force => true do |t|
    t.string  "name"
    t.text    "description"
    t.integer "category_id"
    t.integer "views_count", :default => 0
    t.string  "slug"
  end

  add_index "forem_forums", ["slug"], :name => "index_forem_forums_on_slug", :unique => true

  create_table "forem_groups", :force => true do |t|
    t.string "name"
  end

  add_index "forem_groups", ["name"], :name => "index_forem_groups_on_name"

  create_table "forem_memberships", :force => true do |t|
    t.integer "group_id"
    t.integer "member_id"
  end

  add_index "forem_memberships", ["group_id"], :name => "index_forem_memberships_on_group_id"

  create_table "forem_moderator_groups", :force => true do |t|
    t.integer "forum_id"
    t.integer "group_id"
  end

  add_index "forem_moderator_groups", ["forum_id"], :name => "index_forem_moderator_groups_on_forum_id"

  create_table "forem_posts", :force => true do |t|
    t.integer  "topic_id"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "reply_to_id"
    t.string   "state",       :default => "approved"
    t.boolean  "notified",    :default => false
  end

  add_index "forem_posts", ["reply_to_id"], :name => "index_forem_posts_on_reply_to_id"
  add_index "forem_posts", ["state"], :name => "index_forem_posts_on_state"
  add_index "forem_posts", ["topic_id"], :name => "index_forem_posts_on_topic_id"
  add_index "forem_posts", ["user_id"], :name => "index_forem_posts_on_user_id"

  create_table "forem_subscriptions", :force => true do |t|
    t.integer "subscriber_id"
    t.integer "topic_id"
  end

  create_table "forem_topics", :force => true do |t|
    t.integer  "forum_id"
    t.integer  "user_id"
    t.string   "subject"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.boolean  "locked",       :default => false,      :null => false
    t.boolean  "pinned",       :default => false
    t.boolean  "hidden",       :default => false
    t.datetime "last_post_at"
    t.string   "state",        :default => "approved"
    t.integer  "views_count",  :default => 0
    t.string   "slug"
  end

  add_index "forem_topics", ["forum_id"], :name => "index_forem_topics_on_forum_id"
  add_index "forem_topics", ["slug"], :name => "index_forem_topics_on_slug", :unique => true
  add_index "forem_topics", ["state"], :name => "index_forem_topics_on_state"
  add_index "forem_topics", ["user_id"], :name => "index_forem_topics_on_user_id"

  create_table "forem_views", :force => true do |t|
    t.integer  "user_id"
    t.integer  "viewable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count",             :default => 0
    t.string   "viewable_type"
    t.datetime "current_viewed_at"
    t.datetime "past_viewed_at"
  end

  add_index "forem_views", ["updated_at"], :name => "index_forem_views_on_updated_at"
  add_index "forem_views", ["user_id"], :name => "index_forem_views_on_user_id"
  add_index "forem_views", ["viewable_id"], :name => "index_forem_views_on_topic_id"

  create_table "gages", :force => true do |t|
    t.string   "gage_number"
    t.string   "gage_type"
    t.string   "description"
    t.string   "location"
    t.string   "manufacturer"
    t.string   "manufacturer_part_number"
    t.string   "servicing_company"
    t.string   "servicing_phone"
    t.string   "calibration_period"
    t.date     "calibration_last_done"
    t.date     "calibration_due"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "status"
  end

  create_table "product_bulletins", :force => true do |t|
    t.integer  "number"
    t.date     "date_created"
    t.string   "model"
    t.text     "subject"
    t.string   "written_by"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "revision"
  end

  create_table "request_files", :force => true do |t|
    t.integer  "request_id"
    t.string   "file"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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
    t.decimal  "purch_cost",        :precision => 9, :scale => 2
    t.decimal  "acct_price",        :precision => 9, :scale => 2
    t.decimal  "final_price",       :precision => 9, :scale => 2
    t.string   "final_lead"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.integer  "request_id"
    t.string   "design_type"
    t.string   "relative_size"
    t.string   "substitution_type"
    t.string   "billing"
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
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
    t.decimal  "total_price",          :precision => 9, :scale => 2
    t.string   "total_lead"
    t.text     "engineering_notes"
    t.text     "manufacturing_notes"
    t.text     "accounting_notes"
    t.string   "deliverable"
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

  create_table "treq_files", :force => true do |t|
    t.integer  "treq_id"
    t.string   "file"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "treqs", :force => true do |t|
    t.integer  "test_number"
    t.date     "date_recieved"
    t.string   "submitted_by"
    t.string   "pump_model"
    t.string   "technician"
    t.date     "date_complete"
    t.text     "description"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.string   "email"
    t.string   "title"
    t.string   "department"
    t.boolean  "forem_admin",          :default => false
    t.string   "forem_state",          :default => "approved"
    t.boolean  "forem_auto_subscribe", :default => false
  end

end
