# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_05_16_044546) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees", force: :cascade do |t|
    t.string "buid"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.integer "ug_graduation_year"
    t.string "ug_college"
    t.string "ug_program"
    t.string "ug_degree"
    t.integer "gr_graduation_year"
    t.string "gr_college"
    t.string "gr_program"
    t.string "gr_degree"
    t.string "category"
    t.string "company"
    t.string "position"
    t.datetime "checked_in", precision: nil
    t.datetime "printed", precision: nil
    t.boolean "is_faculty", default: false
    t.boolean "is_staff", default: false
  end

  create_table "brags", force: :cascade do |t|
    t.string "name"
    t.string "buid"
    t.text "message"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
