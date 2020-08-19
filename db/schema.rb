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

ActiveRecord::Schema.define(version: 2020_08_19_193750) do

  create_table "hikers", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "experience"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.string "review"
    t.integer "trail_id"
    t.integer "hiker_id"
    t.index ["hiker_id"], name: "index_reviews_on_hiker_id"
    t.index ["trail_id"], name: "index_reviews_on_trail_id"
  end

  create_table "trails", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "difficulty"
    t.integer "length"
    t.integer "elevation"
    t.string "route"
  end

end
