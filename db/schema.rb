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

ActiveRecord::Schema.define(version: 20140417141112) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "donations", force: true do |t|
    t.datetime "closed_at"
    t.string   "status"
    t.integer  "need_id"
    t.integer  "donor_id"
    t.string   "pic1"
    t.string   "pic2"
    t.string   "pic3"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "individuals", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  default: false
  end

  add_index "individuals", ["email"], name: "index_individuals_on_email", unique: true, using: :btree
  add_index "individuals", ["reset_password_token"], name: "index_individuals_on_reset_password_token", unique: true, using: :btree

  create_table "inquiries", force: true do |t|
    t.integer  "merchandise_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "individual_id"
  end

  create_table "merchandises", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "individual_id"
    t.integer  "organization_id"
    t.string   "title"
    t.string   "description"
    t.boolean  "agree"
    t.string   "pic1"
    t.string   "pic2"
    t.string   "pic3"
    t.float    "price"
    t.integer  "donation_percent"
    t.boolean  "sold"
  end

  create_table "needs", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
    t.string   "title"
    t.string   "description"
  end

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.text     "about"
    t.string   "website"
  end

  add_index "organizations", ["email"], name: "index_organizations_on_email", unique: true, using: :btree
  add_index "organizations", ["reset_password_token"], name: "index_organizations_on_reset_password_token", unique: true, using: :btree

  create_table "purchases", force: true do |t|
    t.integer  "merchandise_id"
    t.string   "status"
    t.datetime "closed_at"
    t.integer  "buyer_id"
    t.boolean  "agree"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
