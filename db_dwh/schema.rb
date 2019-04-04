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

ActiveRecord::Schema.define(version: 2019_04_01_193631) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dimcustomers", force: :cascade do |t|
    t.date "date_of_creation"
    t.string "business_name"
    t.string "full_name"
    t.string "email"
    t.integer "numbers_of_elevators"
    t.string "city"
  end

  create_table "fact_intervention", force: :cascade do |t|
    t.integer "admin_id"
    t.integer "building_id"
    t.integer "battery_id"
    t.integer "column_id"
    t.integer "elevator_id"
    t.string "start_intervention_date_hour"
    t.string "end_intervention_date_hour"
    t.string "result"
    t.string "report"
    t.string "status"
  end

  create_table "factcontact", force: :cascade do |t|
    t.integer "lead_id"
    t.date "created_at"
    t.string "business_name"
    t.string "email"
    t.string "project_name"
  end

  create_table "factelevator", force: :cascade do |t|
    t.integer "elevator_id"
    t.string "serial_number"
    t.date "installation_date"
    t.integer "building_id"
    t.integer "customer_id"
    t.string "building_city"
  end

  create_table "factquotes", force: :cascade do |t|
    t.integer "quote_id"
    t.date "created_at"
    t.string "business_name"
    t.string "email"
    t.integer "number_elevator"
  end

end
