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

ActiveRecord::Schema.define(version: 20181207200228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "events", id: :serial, force: :cascade do |t|
    t.datetime "event_date_time"
    t.integer "user_id"
    t.string "type"
    t.string "pid"
    t.string "software"
    t.text "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "summary"
    t.string "outcome"
    t.text "detail"
    t.text "exception"
    t.string "user_key"
    t.string "permanent_id"
    t.index ["event_date_time"], name: "index_events_on_event_date_time"
    t.index ["outcome"], name: "index_events_on_outcome"
    t.index ["permanent_id"], name: "index_events_on_permanent_id"
    t.index ["pid"], name: "index_events_on_pid"
    t.index ["type"], name: "index_events_on_type"
  end

  create_table "orm_resources", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.jsonb "metadata", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "internal_resource"
    t.integer "lock_version"
    t.index "metadata jsonb_path_ops", name: "index_orm_resources_on_metadata_jsonb_path_ops", using: :gin
    t.index ["internal_resource"], name: "index_orm_resources_on_internal_resource"
    t.index ["metadata"], name: "index_orm_resources_on_metadata", using: :gin
    t.index ["updated_at"], name: "index_orm_resources_on_updated_at"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", default: "", null: false
    t.string "first_name"
    t.string "middle_name"
    t.string "nickname"
    t.string "last_name"
    t.string "display_name"
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
