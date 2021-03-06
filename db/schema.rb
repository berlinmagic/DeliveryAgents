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

ActiveRecord::Schema.define(version: 20140622103640) do

  create_table "addresses", force: true do |t|
    t.string   "street"
    t.string   "street_number"
    t.string   "zip"
    t.string   "city"
    t.string   "subcity"
    t.string   "state"
    t.string   "country"
    t.float    "longitude"
    t.float    "latitude"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["latitude"], name: "index_addresses_on_latitude"
  add_index "addresses", ["longitude"], name: "index_addresses_on_longitude"
  add_index "addresses", ["owner_type", "owner_id"], name: "index_addresses_on_owner_type_and_owner_id"

  create_table "applications", force: true do |t|
    t.integer  "job_id"
    t.integer  "agent_id"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applications", ["agent_id"], name: "index_applications_on_agent_id"
  add_index "applications", ["job_id"], name: "index_applications_on_job_id"

  create_table "jobs", force: true do |t|
    t.string   "job_type"
    t.text     "description"
    t.datetime "date"
    t.integer  "duration"
    t.string   "state"
    t.integer  "client_id"
    t.integer  "agent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "jobs", ["agent_id"], name: "index_jobs_on_agent_id"
  add_index "jobs", ["client_id"], name: "index_jobs_on_client_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "user_type"
    t.string   "image_uid"
    t.string   "image_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
