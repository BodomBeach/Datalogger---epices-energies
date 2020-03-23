# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_20_164015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hourly_productions", force: :cascade do |t|
    t.integer "energy"
    t.bigint "inverter_id"
    t.bigint "total_daily_production_id"
    t.datetime "production_hour"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["inverter_id", "production_hour"], name: "hourly_on_inverter_and_daily_index", unique: true
    t.index ["inverter_id"], name: "index_hourly_productions_on_inverter_id"
    t.index ["total_daily_production_id"], name: "index_hourly_productions_on_total_daily_production_id"
  end

  create_table "inverters", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "total_daily_productions", force: :cascade do |t|
    t.integer "energy"
    t.date "production_day"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["production_day"], name: "index_total_daily_productions_on_production_day", unique: true
  end

  create_table "total_daily_productions_inverters", force: :cascade do |t|
    t.integer "total_daily_production_id"
    t.integer "inverter_id"
    t.index ["total_daily_production_id", "inverter_id"], name: "total_daily_productions_inverters_index"
  end

  add_foreign_key "hourly_productions", "inverters"
  add_foreign_key "hourly_productions", "total_daily_productions"
  add_foreign_key "total_daily_productions_inverters", "inverters"
  add_foreign_key "total_daily_productions_inverters", "total_daily_productions"
end
