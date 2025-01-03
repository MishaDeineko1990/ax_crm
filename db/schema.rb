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

ActiveRecord::Schema[7.2].define(version: 2024_11_22_142828) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "goods", force: :cascade do |t|
    t.integer "length"
    t.integer "width"
    t.integer "height"
    t.string "name"
    t.string "weight"
    t.string "price"
    t.string "description"
    t.string "image"
    t.string "tags"
    t.string "custom_data"
    t.string "other_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sale_id", null: false
    t.index ["sale_id"], name: "index_goods_on_sale_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.string "ederpou"
    t.string "ipn"
    t.string "type_rent"
    t.string "factic_address"
    t.string "legal_address"
    t.string "send_adress"
    t.string "number_count_bank"
    t.string "mfo"
    t.string "name_and_requisites_bank"
    t.string "phone"
    t.string "mail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_organizations_on_user_id"
  end

  create_table "oue_organizations", force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.string "ederpou"
    t.string "ipn"
    t.string "type_rent"
    t.string "factic_address"
    t.string "legal_address"
    t.string "send_adress"
    t.string "number_count_bank"
    t.string "mfo"
    t.string "name_and_requisites_bank"
    t.string "phone"
    t.string "mail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "perssons", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "father_name"
    t.string "name_for_contract"
    t.string "phone"
    t.string "email"
    t.string "send_adress"
    t.string "role"
    t.date "birth_data"
    t.string "note_data"
    t.string "other_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "organization_id"
    t.index ["user_id"], name: "index_perssons_on_user_id"
  end

  create_table "sale_organizations", force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.string "ederpou"
    t.string "ipn"
    t.string "type_rent"
    t.string "factic_address"
    t.string "legal_address"
    t.string "send_adress"
    t.string "number_count_bank"
    t.string "mfo"
    t.string "name_and_requisites_bank"
    t.string "phone"
    t.string "mail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer "status"
    t.string "note"
    t.string "other_data"
    t.bigint "user_id", null: false
    t.bigint "organization_id"
    t.bigint "oue_organization_id"
    t.bigint "persson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_sales_on_organization_id"
    t.index ["oue_organization_id"], name: "index_sales_on_oue_organization_id"
    t.index ["persson_id"], name: "index_sales_on_persson_id"
    t.index ["user_id"], name: "index_sales_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "t1"
    t.string "t2"
    t.string "t3"
    t.string "t4"
    t.string "t5"
    t.string "t6"
    t.string "t7"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags_tovars", id: false, force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "tovar_id", null: false
  end

  create_table "tovars", force: :cascade do |t|
    t.integer "length"
    t.integer "width"
    t.integer "height"
    t.string "name"
    t.string "weight"
    t.string "price"
    t.string "description"
    t.string "image"
    t.string "tags"
    t.string "custom_data"
    t.string "other_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "goods", "sales"
  add_foreign_key "sales", "organizations"
  add_foreign_key "sales", "oue_organizations"
  add_foreign_key "sales", "perssons"
  add_foreign_key "sales", "users"
end
