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

ActiveRecord::Schema.define(version: 20141208065834) do

  create_table "add_follows_count_to_jobs", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["job_id"], name: "index_comments_on_job_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "countries", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "countries", ["user_id"], name: "index_countries_on_user_id"

  create_table "currents", force: true do |t|
    t.integer  "experience_id"
    t.integer  "education_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "degrees", force: true do |t|
    t.integer  "education_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "educatings", force: true do |t|
    t.integer  "education_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "educatings", ["education_id"], name: "index_educatings_on_education_id"
  add_index "educatings", ["location_id"], name: "index_educatings_on_location_id"

  create_table "educations", force: true do |t|
    t.integer  "user_id"
    t.string   "degree"
    t.string   "institute"
    t.date     "from"
    t.date     "to"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "current_id"
    t.integer  "degree_id"
    t.integer  "institute_id"
  end

  add_index "educations", ["current_id"], name: "index_educations_on_current_id"
  add_index "educations", ["degree_id"], name: "index_educations_on_degree_id"
  add_index "educations", ["institute_id"], name: "index_educations_on_institute_id"
  add_index "educations", ["user_id"], name: "index_educations_on_user_id"

  create_table "employers", force: true do |t|
    t.integer  "job_id"
    t.integer  "experience_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "experiences", force: true do |t|
    t.integer  "user_id"
    t.string   "position"
    t.string   "employer"
    t.integer  "salary",      default: 0, null: false
    t.date     "from"
    t.date     "to"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "current_id"
    t.integer  "position_id"
    t.integer  "employer_id"
  end

  add_index "experiences", ["current_id"], name: "index_experiences_on_current_id"
  add_index "experiences", ["employer_id"], name: "index_experiences_on_employer_id"
  add_index "experiences", ["position_id"], name: "index_experiences_on_position_id"
  add_index "experiences", ["user_id"], name: "index_experiences_on_user_id"

  create_table "follows", force: true do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["job_id"], name: "index_follows_on_job_id"
  add_index "follows", ["user_id"], name: "index_follows_on_user_id"

  create_table "genders", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "institutes", force: true do |t|
    t.integer  "education_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.integer  "user_id"
    t.string   "position"
    t.string   "employer"
    t.integer  "number"
    t.date     "deadline"
    t.integer  "salary_min",      default: 0,      null: false
    t.integer  "salary_max",      default: 0,      null: false
    t.string   "currency",        default: "USD",  null: false
    t.text     "requirement"
    t.text     "responsibility"
    t.text     "benefit"
    t.text     "company_profile"
    t.text     "suggestion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "follows_count",   default: 0
    t.integer  "comments_count",  default: 0
    t.integer  "type_id"
    t.integer  "position_id"
    t.integer  "employer_id"
    t.string   "aasm_state",      default: "open"
    t.integer  "submission_id"
  end

  add_index "jobs", ["employer_id"], name: "index_jobs_on_employer_id"
  add_index "jobs", ["position_id"], name: "index_jobs_on_position_id"
  add_index "jobs", ["submission_id"], name: "index_jobs_on_submission_id"
  add_index "jobs", ["type_id"], name: "index_jobs_on_type_id"
  add_index "jobs", ["user_id"], name: "index_jobs_on_user_id"

  create_table "languages", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "languages", ["user_id"], name: "index_languages_on_user_id"

  create_table "livings", force: true do |t|
    t.integer  "user_id"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "livings", ["country_id"], name: "index_livings_on_country_id"
  add_index "livings", ["user_id"], name: "index_livings_on_user_id"

  create_table "locatings", force: true do |t|
    t.integer  "job_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locatings", ["job_id"], name: "index_locatings_on_job_id"
  add_index "locatings", ["location_id"], name: "index_locatings_on_location_id"

  create_table "locations", force: true do |t|
    t.integer  "job_id"
    t.integer  "user_id"
    t.integer  "experience_id"
    t.integer  "education_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["education_id"], name: "index_locations_on_education_id"
  add_index "locations", ["experience_id"], name: "index_locations_on_experience_id"
  add_index "locations", ["job_id"], name: "index_locations_on_job_id"
  add_index "locations", ["user_id"], name: "index_locations_on_user_id"

  create_table "majorings", force: true do |t|
    t.integer  "education_id"
    t.integer  "profession_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "majorings", ["education_id"], name: "index_majorings_on_education_id"
  add_index "majorings", ["profession_id"], name: "index_majorings_on_profession_id"

  create_table "positions", force: true do |t|
    t.integer  "job_id"
    t.integer  "experience_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professions", force: true do |t|
    t.integer  "education_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "professions", ["education_id"], name: "index_professions_on_education_id"

  create_table "speakings", force: true do |t|
    t.integer  "user_id"
    t.integer  "language_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "speakings", ["language_id"], name: "index_speakings_on_language_id"
  add_index "speakings", ["user_id"], name: "index_speakings_on_user_id"

  create_table "stayings", force: true do |t|
    t.integer  "user_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stayings", ["location_id"], name: "index_stayings_on_location_id"
  add_index "stayings", ["user_id"], name: "index_stayings_on_user_id"

  create_table "submissions", force: true do |t|
    t.string   "aasm_state", default: "applying"
    t.integer  "job_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", force: true do |t|
    t.integer  "job_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.date     "birthday"
    t.text     "summary"
    t.text     "skill"
    t.text     "other_info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.integer  "gender_id"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer  "submission_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["gender_id"], name: "index_users_on_gender_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["submission_id"], name: "index_users_on_submission_id"

  create_table "visas", force: true do |t|
    t.integer  "user_id"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "visas", ["country_id"], name: "index_visas_on_country_id"
  add_index "visas", ["user_id"], name: "index_visas_on_user_id"

  create_table "workings", force: true do |t|
    t.integer  "experience_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "workings", ["experience_id"], name: "index_workings_on_experience_id"
  add_index "workings", ["location_id"], name: "index_workings_on_location_id"

end
