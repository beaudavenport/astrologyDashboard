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

ActiveRecord::Schema.define(version: 20150325160920) do

  create_table "content_pages", force: true do |t|
    t.string   "heading"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.text     "notification_params"
    t.string   "status"
    t.string   "transaction_id"
    t.datetime "purchased_at"
    t.string   "email"
    t.string   "customer"
    t.text     "customer_info"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "filled_on"
  end

  add_index "orders", ["service_id"], name: "index_orders_on_service_id"

  create_table "services", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "required_info"
  end

end
