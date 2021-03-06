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

ActiveRecord::Schema.define(version: 2021_11_26_063354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
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
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "areas", force: :cascade do |t|
    t.string "type_of_area"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "assign_email_notifications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "email_notification_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active", default: false
    t.index ["email_notification_id"], name: "index_assign_email_notifications_on_email_notification_id"
    t.index ["user_id"], name: "index_assign_email_notifications_on_user_id"
  end

  create_table "assignments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_assignments_on_role_id"
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name_of_company"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name_company_contact"
    t.string "last_name_company_contact"
    t.string "email_company_contact"
    t.string "phone_company_contact"
    t.integer "number_of_employees_company"
    t.datetime "trial_started_at"
    t.datetime "trial_ended_at"
    t.boolean "company_account_activated", default: true
    t.boolean "free_trial_period_activated", default: true
    t.integer "free_trial_period_days"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name_of_department"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "email_notifications", force: :cascade do |t|
    t.string "notification"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "end_contract_reasons", force: :cascade do |t|
    t.string "name_of_end_reason"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "type_of_genre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "type_of_group"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "levels", force: :cascade do |t|
    t.string "type_of_level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notes", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "periods", force: :cascade do |t|
    t.integer "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "note", default: false
    t.string "comment"
    t.date "permission_start_date"
    t.date "permission_rejoin_date"
    t.bigint "type_of_permission_id"
    t.bigint "user_id"
    t.index ["type_of_permission_id"], name: "index_permissions_on_type_of_permission_id"
    t.index ["user_id"], name: "index_permissions_on_user_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "name_of_position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "role_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sicks", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "doctor_note_sickeness", default: false
    t.boolean "rejoin_note_sickeness", default: false
    t.string "comment"
    t.date "start_date_sickness"
    t.date "rejoin_date_sickness"
    t.string "type_of_sickness"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_sicks_on_user_id"
  end

  create_table "type_of_contracts", force: :cascade do |t|
    t.string "name_type_of_contract"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "type_of_permissions", force: :cascade do |t|
    t.string "name_of_permission"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "type_of_shifts", force: :cascade do |t|
    t.string "name_of_shift"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.bigint "company_id"
    t.string "type"
    t.date "birth_date"
    t.date "end_date"
    t.string "sin_num"
    t.string "personal_email"
    t.string "id_num"
    t.string "phone_number"
    t.string "bank_account"
    t.integer "annual_salary"
    t.boolean "active", default: true
    t.integer "vacation_counter", default: 0
    t.date "trial_period"
    t.bigint "type_of_contract_id"
    t.bigint "department_id"
    t.bigint "genre_id"
    t.integer "previous_year_vacation_counter", default: 0
    t.bigint "type_of_shift_id"
    t.bigint "work_center_id"
    t.bigint "position_id"
    t.string "created_by"
    t.string "modified_by"
    t.date "start_date"
    t.bigint "end_contract_reason_id"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["department_id"], name: "index_users_on_department_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["end_contract_reason_id"], name: "index_users_on_end_contract_reason_id"
    t.index ["genre_id"], name: "index_users_on_genre_id"
    t.index ["position_id"], name: "index_users_on_position_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["type_of_contract_id"], name: "index_users_on_type_of_contract_id"
    t.index ["type_of_shift_id"], name: "index_users_on_type_of_shift_id"
    t.index ["work_center_id"], name: "index_users_on_work_center_id"
  end

  create_table "work_centers", force: :cascade do |t|
    t.string "name_of_work_center"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "assign_email_notifications", "email_notifications"
  add_foreign_key "assign_email_notifications", "users"
  add_foreign_key "assignments", "roles"
  add_foreign_key "assignments", "users"
  add_foreign_key "notes", "users"
  add_foreign_key "permissions", "type_of_permissions"
  add_foreign_key "permissions", "users"
  add_foreign_key "sicks", "users"
  add_foreign_key "users", "companies"
  add_foreign_key "users", "departments"
  add_foreign_key "users", "end_contract_reasons"
  add_foreign_key "users", "genres"
  add_foreign_key "users", "positions"
  add_foreign_key "users", "type_of_contracts"
  add_foreign_key "users", "type_of_shifts"
  add_foreign_key "users", "work_centers"
end
