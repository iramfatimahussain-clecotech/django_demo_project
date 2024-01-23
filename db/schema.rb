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

ActiveRecord::Schema[7.0].define(version: 2024_01_23_083423) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "account_no"
    t.string "ifsc"
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "bank_name"
    t.boolean "bank"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_transactions", force: :cascade do |t|
    t.integer "organization_id"
    t.integer "amount"
    t.date "salary_date"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "employee_absences", force: :cascade do |t|
    t.integer "user_id"
    t.decimal "leave_count", default: "0.0"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "salary_transaction_id"
  end

  create_table "employee_salaries", force: :cascade do |t|
    t.integer "user_id"
    t.bigint "salary_amount"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "salary_transaction_id"
    t.integer "bonus"
    t.integer "advance_payment"
    t.integer "professional_tax"
    t.integer "medical_insurance"
    t.integer "current_income_tax"
    t.integer "employee_absence_id"
    t.integer "to_bank_amount"
    t.integer "deduction_income_tax"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "start_date"
    t.string "date_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "festivals", force: :cascade do |t|
    t.string "name"
    t.date "festival_date"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "greetings", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "sender_id"
    t.integer "receiver_id"
    t.integer "user_id"
  end

  create_table "inboxes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.string "content"
    t.integer "greeting_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "department_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "contact"
    t.string "email"
    t.string "address"
  end

  create_table "phone_calls", force: :cascade do |t|
    t.string "phone_no"
    t.integer "user_id"
    t.string "pre_message"
    t.string "transfer_to"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "salary_formulas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "salary_slip_masters", force: :cascade do |t|
    t.integer "salary_formula_id"
    t.integer "basic"
    t.integer "hra"
    t.integer "travel"
    t.integer "telephone"
    t.integer "medical"
    t.integer "special"
    t.integer "other"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "salary_slips", force: :cascade do |t|
    t.datetime "month", precision: nil
    t.integer "user_id"
    t.integer "basic"
    t.integer "hra"
    t.integer "travel"
    t.integer "telephone"
    t.integer "medical"
    t.integer "special"
    t.integer "other"
    t.jsonb "deductions"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.float "payable_salary"
  end

  create_table "salary_transactions", force: :cascade do |t|
    t.decimal "salary", precision: 16, scale: 2
    t.integer "organization_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
    t.date "salary_date"
    t.integer "company_transaction_id"
    t.string "account_no"
    t.string "ifsc"
    t.integer "month"
    t.integer "year"
  end

  create_table "teams", force: :cascade do |t|
    t.string "uuid"
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.datetime "date_of_joining", precision: nil
    t.string "employment"
    t.string "address"
    t.string "designation"
    t.string "avatar"
  end

  create_table "time_logs", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "in_time", precision: nil
    t.datetime "out_time", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "tweets", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.string "name"
    t.integer "organization_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "employee_id"
    t.string "provider"
    t.string "uid"
    t.string "token"
    t.integer "expires_at"
    t.boolean "expires"
    t.string "refresh_token"
    t.boolean "status", default: false
    t.string "confirm_token"
    t.string "authentication_token", limit: 30
    t.text "fcm_token"
    t.string "device_type"
    t.boolean "activity_status", default: false
    t.string "department_id"
    t.string "otp_code"
    t.boolean "is_valid_email", default: true
    t.string "mobile_number"
    t.string "uuid"
    t.string "user_profile"
    t.integer "gross_monthly_salary"
    t.integer "income_tax"
    t.string "pan_card"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
