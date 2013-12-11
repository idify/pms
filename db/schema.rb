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

ActiveRecord::Schema.define(version: 20131209080627) do

  create_table "addresses", force: true do |t|
    t.integer  "user_id",                  null: false
    t.string   "address_type", limit: 20,  null: false
    t.string   "address",                  null: false
    t.integer  "country_id",   limit: 2,   null: false
    t.integer  "state_id",     limit: 2,   null: false
    t.integer  "city_id",      limit: 2,   null: false
    t.string   "pin_code",     limit: 20,  null: false
    t.string   "attachment",   limit: 200
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admins", force: true do |t|
    t.string "email", limit: 80
  end

  create_table "bills", force: true do |t|
    t.integer  "user_id"
    t.string   "description"
    t.date     "bill_date"
    t.decimal  "amount"
    t.integer  "status",      default: 0
    t.string   "attachment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "calendar_holidays", force: true do |t|
    t.integer "calendar_id"
    t.string  "holiday_name"
    t.integer "holiday_type"
    t.date    "holiday_date"
  end

  create_table "calendars", force: true do |t|
    t.string   "name",        limit: 20
    t.string   "start_month", limit: 10
    t.string   "off_days",    limit: 25
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "certifications", force: true do |t|
    t.integer  "user_id",                    null: false
    t.string   "name",           limit: 100, null: false
    t.date     "completed_date",             null: false
    t.string   "attachment",     limit: 200
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: true do |t|
    t.string   "code",       limit: 3,  null: false
    t.string   "name",       limit: 60, null: false
    t.integer  "state_id",   limit: 2,  null: false
    t.integer  "country_id", limit: 2,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: true do |t|
    t.string   "code",       limit: 2,  null: false
    t.string   "name",       limit: 60, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "educations", force: true do |t|
    t.integer  "user_id",                        null: false
    t.string   "board_university",   limit: 80,  null: false
    t.integer  "passout",            limit: 2,   null: false
    t.string   "qualification_name", limit: 100, null: false
    t.float    "percentage",                     null: false
    t.string   "attachment",         limit: 200
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emp_claim_actions", force: true do |t|
    t.integer  "emp_total_claim_id",             null: false
    t.string   "status",             limit: 10,  null: false
    t.integer  "updated_by",                     null: false
    t.string   "reject_reason",      limit: 300
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emp_total_claims", force: true do |t|
    t.float    "total_amount",             null: false
    t.string   "status",       limit: 500, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employee_component_sessions", force: true do |t|
    t.integer  "employeesession_id",             null: false
    t.string   "status",             limit: 10,  null: false
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reject_reason",      limit: 300
  end

  create_table "employee_components", force: true do |t|
    t.integer  "tax_component_master_element_id", null: false
    t.integer  "employee_component_session_id",   null: false
    t.float    "amount",                          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employee_lwps", force: true do |t|
    t.integer  "employee_id"
    t.integer  "employeesession_id", limit: 8, null: false
    t.date     "dates"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employee_skills", force: true do |t|
    t.integer  "user_id",                               null: false
    t.integer  "skill_id",    limit: 2,                 null: false
    t.integer  "proficiency", limit: 2,                 null: false
    t.boolean  "delete_flag",           default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employeecalendars", force: true do |t|
    t.integer "employee_id", null: false
    t.integer "calendar_id"
    t.date    "start_date"
    t.date    "end_date"
  end

  create_table "employeeleaves", force: true do |t|
    t.integer "employeeleavestatus_id", limit: 8, null: false
    t.integer "leavetypemaster_id"
    t.date    "leave_date"
    t.string  "leave_day_type",         limit: 4
  end

  create_table "employeeleavestatuses", force: true do |t|
    t.integer  "employeesession_id",     limit: 8,   null: false
    t.date     "leave_from_date",                    null: false
    t.date     "leave_to_date"
    t.string   "leave_status",           limit: 10,  null: false
    t.integer  "leave_updated_by"
    t.datetime "leave_updated_datetime"
    t.string   "leave_reason",           limit: 300, null: false
    t.string   "leave_cancel_reason",    limit: 300
    t.integer  "created_by",                         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employeesessions", force: true do |t|
    t.integer  "employee_id"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "active_status"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employeetotalleaves", force: true do |t|
    t.integer  "employeesession_id",  limit: 8, null: false
    t.integer  "leavetypemaster_id",            null: false
    t.float    "number_of_leave",               null: false
    t.float    "carry_forward_leave",           null: false
    t.float    "leave_taken",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "experiences", force: true do |t|
    t.integer  "user_id",                  null: false
    t.string   "company_name", limit: 80,  null: false
    t.date     "from_date",                null: false
    t.date     "to_date"
    t.string   "designation",  limit: 100, null: false
    t.text     "summary"
    t.string   "attachment",   limit: 200
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "family_details", force: true do |t|
    t.integer  "user_id",                null: false
    t.string   "name",       limit: 100, null: false
    t.string   "relation",   limit: 50,  null: false
    t.date     "dob",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hrms_notifications", force: true do |t|
    t.integer  "user_id",                  null: false
    t.string   "item",          limit: 25, null: false
    t.integer  "total_counter",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leavemasters", force: true do |t|
    t.integer  "leavetypemaster_id"
    t.integer  "number_of_leave",     limit: 2,  null: false
    t.integer  "carry_forward_leave", limit: 2,  null: false
    t.string   "grade_type",          limit: 10
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leavetypemasters", force: true do |t|
    t.string   "leave_type",    limit: 20
    t.boolean  "active_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "login_details", force: true do |t|
    t.integer  "project_id"
    t.string   "user_name"
    t.string   "password"
    t.string   "git_url"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "monthly_salaries", force: true do |t|
    t.integer  "employee_id"
    t.integer  "month"
    t.integer  "year"
    t.integer  "total_days"
    t.integer  "lwps"
    t.integer  "no_of_days"
    t.float    "net_deduction"
    t.float    "gross_salary_after_lwps"
    t.boolean  "is_delivered",            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "monthly_salary_breakups", force: true do |t|
    t.integer  "monthly_salary_id"
    t.integer  "head_id"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permission_users", id: false, force: true do |t|
    t.integer  "user_id"
    t.integer  "permission_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", force: true do |t|
    t.string   "crud_operation"
    t.integer  "access"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personal_informations", force: true do |t|
    t.integer  "user_id",                         null: false
    t.date     "dob",                             null: false
    t.string   "blood_group",          limit: 5
    t.string   "pan_no",               limit: 20
    t.string   "passport_no",          limit: 20
    t.date     "passport_expiry_date"
    t.string   "bank_account_number"
    t.string   "bank_name"
    t.string   "branch"
    t.string   "ifsc_code"
    t.string   "alternate_emailid"
    t.string   "mobile_no",            limit: 15, null: false
    t.string   "alternate_contact_no", limit: 20
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "marital_status",                  null: false
    t.date     "anniversary_date"
    t.string   "gender",               limit: 1,  null: false
  end

  create_table "project_modules", force: true do |t|
    t.string   "project_module_name"
    t.string   "project_module_description"
    t.date     "est_start_date"
    t.date     "est_end_date"
    t.date     "act_start_date"
    t.date     "act_end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
  end

  create_table "project_repositories", force: true do |t|
    t.integer  "project_id"
    t.string   "title"
    t.string   "document"
    t.string   "document_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
    t.integer  "user_id"
    t.date     "start_date"
    t.date     "end_date"
  end

  create_table "projects", force: true do |t|
    t.string   "project_name"
    t.text     "description"
    t.date     "est_start_date"
    t.date     "est_end_date"
    t.date     "act_start_date"
    t.date     "act_end_date"
    t.text     "additional_details"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "manager"
  end

  create_table "salaries", force: true do |t|
    t.integer "employee_id",                   null: false
    t.float   "gross_salary",                  null: false
    t.date    "effected_from",                 null: false
    t.date    "effected_till"
    t.boolean "approved",      default: false
  end

  create_table "salary_breakups", force: true do |t|
    t.integer "salary_id",               null: false
    t.integer "head_id",                 null: false
    t.float   "amount",    default: 0.0
  end

  create_table "salary_head_values", force: true do |t|
    t.string  "grade",               limit: 50
    t.integer "head"
    t.decimal "head_value"
    t.string  "value_type",          limit: 10
    t.integer "per_of",                         default: 0
    t.boolean "is_deducted_via_lwp",            default: false
  end

  create_table "salary_heads", force: true do |t|
    t.string  "head",      limit: 50
    t.string  "head_type", limit: 20
    t.boolean "taxable",              default: true
  end

  create_table "skills", force: true do |t|
    t.string   "name",        limit: 60, null: false
    t.integer  "created_by"
    t.string   "creator",     limit: 15
    t.boolean  "delete_flag",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: true do |t|
    t.string   "code",       limit: 3,  null: false
    t.string   "name",       limit: 60, null: false
    t.integer  "country_id", limit: 2,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.integer  "project_id"
    t.string   "task_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_module_id"
    t.integer  "user_id"
    t.datetime "est_start_date"
    t.datetime "est_end_date"
    t.datetime "act_start_date"
    t.datetime "act_end_date"
    t.string   "task"
    t.string   "user"
    t.integer  "status",            default: 0
  end

  create_table "tax_component_master_elements", force: true do |t|
    t.integer  "tax_component_master_id",             null: false
    t.text     "question",                            null: false
    t.string   "hint",                    limit: 250
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tax_component_masters", force: true do |t|
    t.integer  "component_group_id",             null: false
    t.string   "title",              limit: 100, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tax_component_max_limits", force: true do |t|
    t.float    "amount",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string  "email"
    t.string  "name"
    t.string  "password"
    t.date    "doj"
    t.string  "grade"
    t.integer "manager_id"
    t.string  "sap_id",            limit: 25
    t.date    "dol"
    t.integer "department"
    t.string  "designation"
    t.integer "working_location"
    t.string  "office_phone",      limit: 20
    t.boolean "isAdmin",                      default: false
    t.boolean "isProject_creator",            default: false
    t.string  "username"
    t.string  "fullname"
    t.boolean "isManager",                    default: false
  end

end
