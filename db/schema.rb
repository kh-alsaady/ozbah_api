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

ActiveRecord::Schema.define(version: 20160723112217) do

  create_table "api_tokens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "access_token"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_api_tokens_on_user_id", using: :btree
  end

  create_table "archived_tasks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_archived_tasks_on_task_id", using: :btree
    t.index ["user_id"], name: "index_archived_tasks_on_user_id", using: :btree
  end

  create_table "task_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",       default: "1"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "tasks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "task_type_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["task_type_id"], name: "index_tasks_on_task_type_id", using: :btree
  end

  create_table "user_task_orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_user_task_orders_on_task_id", using: :btree
    t.index ["user_id", "task_id", "order"], name: "index_user_task_orders_on_user_id_and_task_id_and_order", unique: true, using: :btree
    t.index ["user_id"], name: "index_user_task_orders_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "full_name",       default: ""
    t.string   "email",           default: ""
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "profile_image",   default: ""
    t.string   "username",                     null: false
    t.string   "password_digest"
  end

  add_foreign_key "api_tokens", "users"
  add_foreign_key "archived_tasks", "tasks"
  add_foreign_key "archived_tasks", "users"
  add_foreign_key "tasks", "task_types"
  add_foreign_key "user_task_orders", "tasks"
  add_foreign_key "user_task_orders", "users"
end
