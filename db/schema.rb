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

ActiveRecord::Schema.define(version: 20160730085224) do

  create_table "api_tokens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "access_token"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_api_tokens_on_user_id", using: :btree
  end

  create_table "archived_tasks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "status",     default: 0
    t.index ["task_id"], name: "index_archived_tasks_on_task_id", using: :btree
    t.index ["user_id"], name: "index_archived_tasks_on_user_id", using: :btree
  end

  create_table "pma__bookmark", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", comment: "Bookmarks" do |t|
    t.string "dbase",               default: "", null: false
    t.string "user",                default: "", null: false
    t.string "label",               default: "", null: false, collation: "utf8_general_ci"
    t.text   "query", limit: 65535,              null: false
  end

  create_table "pma__central_columns", primary_key: ["db_name", "col_name"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", comment: "Central list of columns" do |t|
    t.string  "db_name",       limit: 64,                 null: false
    t.string  "col_name",      limit: 64,                 null: false
    t.string  "col_type",      limit: 64,                 null: false
    t.text    "col_length",    limit: 65535
    t.string  "col_collation", limit: 64,                 null: false
    t.boolean "col_isNull",                               null: false
    t.string  "col_extra",                   default: ""
    t.text    "col_default",   limit: 65535
  end

  create_table "pma__column_info", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", comment: "Column information for phpMyAdmin" do |t|
    t.string "db_name",                      limit: 64, default: "", null: false
    t.string "table_name",                   limit: 64, default: "", null: false
    t.string "column_name",                  limit: 64, default: "", null: false
    t.string "comment",                                 default: "", null: false, collation: "utf8_general_ci"
    t.string "mimetype",                                default: "", null: false, collation: "utf8_general_ci"
    t.string "transformation",                          default: "", null: false
    t.string "transformation_options",                  default: "", null: false
    t.string "input_transformation",                    default: "", null: false
    t.string "input_transformation_options",            default: "", null: false
    t.index ["db_name", "table_name", "column_name"], name: "db_name", unique: true, using: :btree
  end

  create_table "pma__designer_settings", primary_key: "username", id: :string, limit: 64, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", comment: "Settings related to Designer" do |t|
    t.text "settings_data", limit: 65535, null: false
  end

  create_table "pma__export_templates", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", comment: "Saved export templates" do |t|
    t.string "username",      limit: 64,    null: false
    t.string "export_type",   limit: 10,    null: false
    t.string "template_name", limit: 64,    null: false
    t.text   "template_data", limit: 65535, null: false
    t.index ["username", "export_type", "template_name"], name: "u_user_type_template", unique: true, using: :btree
  end

  create_table "pma__favorite", primary_key: "username", id: :string, limit: 64, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", comment: "Favorite tables" do |t|
    t.text "tables", limit: 65535, null: false
  end

  create_table "pma__history", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", comment: "SQL history for phpMyAdmin" do |t|
    t.string   "username",  limit: 64,    default: "",                         null: false
    t.string   "db",        limit: 64,    default: "",                         null: false
    t.string   "table",     limit: 64,    default: "",                         null: false
    t.datetime "timevalue",               default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.text     "sqlquery",  limit: 65535,                                      null: false
    t.index ["username", "db", "table", "timevalue"], name: "username", using: :btree
  end

  create_table "pma__navigationhiding", primary_key: ["username", "item_name", "item_type", "db_name", "table_name"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", comment: "Hidden items of navigation tree" do |t|
    t.string "username",   limit: 64, null: false
    t.string "item_name",  limit: 64, null: false
    t.string "item_type",  limit: 64, null: false
    t.string "db_name",    limit: 64, null: false
    t.string "table_name", limit: 64, null: false
  end

  create_table "pma__pdf_pages", primary_key: "page_nr", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", comment: "PDF relation pages for phpMyAdmin" do |t|
    t.string "db_name",    limit: 64, default: "", null: false
    t.string "page_descr", limit: 50, default: "", null: false, collation: "utf8_general_ci"
    t.index ["db_name"], name: "db_name", using: :btree
  end

  create_table "pma__recent", primary_key: "username", id: :string, limit: 64, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", comment: "Recently accessed tables" do |t|
    t.text "tables", limit: 65535, null: false
  end

  create_table "pma__relation", primary_key: ["master_db", "master_table", "master_field"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", comment: "Relation table" do |t|
    t.string "master_db",     limit: 64, default: "", null: false
    t.string "master_table",  limit: 64, default: "", null: false
    t.string "master_field",  limit: 64, default: "", null: false
    t.string "foreign_db",    limit: 64, default: "", null: false
    t.string "foreign_table", limit: 64, default: "", null: false
    t.string "foreign_field", limit: 64, default: "", null: false
    t.index ["foreign_db", "foreign_table"], name: "foreign_field", using: :btree
  end

  create_table "pma__savedsearches", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", comment: "Saved searches" do |t|
    t.string "username",    limit: 64,    default: "", null: false
    t.string "db_name",     limit: 64,    default: "", null: false
    t.string "search_name", limit: 64,    default: "", null: false
    t.text   "search_data", limit: 65535,              null: false
    t.index ["username", "db_name", "search_name"], name: "u_savedsearches_username_dbname", unique: true, using: :btree
  end

  create_table "pma__table_coords", primary_key: ["db_name", "table_name", "pdf_page_number"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", comment: "Table coordinates for phpMyAdmin PDF output" do |t|
    t.string  "db_name",         limit: 64, default: "",  null: false
    t.string  "table_name",      limit: 64, default: "",  null: false
    t.integer "pdf_page_number",            default: 0,   null: false
    t.float   "x",               limit: 24, default: 0.0, null: false, unsigned: true
    t.float   "y",               limit: 24, default: 0.0, null: false, unsigned: true
  end

  create_table "pma__table_info", primary_key: ["db_name", "table_name"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", comment: "Table information for phpMyAdmin" do |t|
    t.string "db_name",       limit: 64, default: "", null: false
    t.string "table_name",    limit: 64, default: "", null: false
    t.string "display_field", limit: 64, default: "", null: false
  end

  create_table "pma__table_uiprefs", primary_key: ["username", "db_name", "table_name"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", comment: "Tables' UI preferences" do |t|
    t.string   "username",    limit: 64,                                         null: false
    t.string   "db_name",     limit: 64,                                         null: false
    t.string   "table_name",  limit: 64,                                         null: false
    t.text     "prefs",       limit: 65535,                                      null: false
    t.datetime "last_update",               default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "pma__tracking", primary_key: ["db_name", "table_name", "version"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", comment: "Database changes tracking for phpMyAdmin" do |t|
    t.string   "db_name",         limit: 64,                     null: false
    t.string   "table_name",      limit: 64,                     null: false
    t.integer  "version",                                        null: false, unsigned: true
    t.datetime "date_created",                                   null: false
    t.datetime "date_updated",                                   null: false
    t.text     "schema_snapshot", limit: 65535,                  null: false
    t.text     "schema_sql",      limit: 65535
    t.text     "data_sql",        limit: 4294967295
    t.string   "tracking",        limit: 188
    t.integer  "tracking_active",                    default: 1, null: false, unsigned: true
  end

  create_table "pma__userconfig", primary_key: "username", id: :string, limit: 64, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", comment: "User preferences storage for phpMyAdmin" do |t|
    t.datetime "timevalue",                 default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.text     "config_data", limit: 65535,                                      null: false
  end

  create_table "pma__usergroups", primary_key: ["usergroup", "tab", "allowed"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", comment: "User groups with configured menu items" do |t|
    t.string "usergroup", limit: 64,               null: false
    t.string "tab",       limit: 64,               null: false
    t.string "allowed",   limit: 1,  default: "N", null: false
  end

  create_table "pma__users", primary_key: ["username", "usergroup"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", comment: "Users and their assignments to user groups" do |t|
    t.string "username",  limit: 64, null: false
    t.string "usergroup", limit: 64, null: false
  end

  create_table "task_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       default: "1"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "tasks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "task_type_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["task_type_id"], name: "index_tasks_on_task_type_id", using: :btree
  end

  create_table "user_task_orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_user_task_orders_on_task_id", using: :btree
    t.index ["user_id", "task_id", "order"], name: "index_user_task_orders_on_user_id_and_task_id_and_order", unique: true, using: :btree
    t.index ["user_id"], name: "index_user_task_orders_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
