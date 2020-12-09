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

ActiveRecord::Schema.define(version: 2020_12_08_224559) do

  create_table "locations", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "snapshots", force: :cascade do |t|
    t.string "city"
    t.string "region"
    t.string "country"
    t.float "high_f"
    t.float "low_f"
    t.float "temp_f"
    t.float "high_c"
    t.float "low_c"
    t.float "temp_c"
    t.float "wind_speed"
    t.string "wind_dir"
    t.string "weather_state"
    t.string "datetime_zulu"
    t.float "predictability"
    t.float "humidity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
