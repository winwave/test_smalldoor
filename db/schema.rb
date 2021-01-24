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

ActiveRecord::Schema.define(version: 2021_01_24_014353) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "member_activities", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "procedure_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_member_activities_on_member_id"
    t.index ["procedure_id"], name: "index_member_activities_on_procedure_id"
  end

  create_table "members", force: :cascade do |t|
    t.datetime "membership_start_date"
    t.datetime "membership_end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "membership_plans_id"
    t.index ["membership_plans_id"], name: "index_members_on_membership_plans_id"
  end

  create_table "membership_plans", force: :cascade do |t|
    t.string "name"
  end

  create_table "procedure_memberships", force: :cascade do |t|
    t.bigint "procedure_id", null: false
    t.bigint "membership_plan_id", null: false
    t.integer "times"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["membership_plan_id"], name: "index_procedure_memberships_on_membership_plan_id"
    t.index ["procedure_id"], name: "index_procedure_memberships_on_procedure_id"
  end

  create_table "procedures", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 8, scale: 2
  end

  add_foreign_key "members", "membership_plans", column: "membership_plans_id"
end
