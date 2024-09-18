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

ActiveRecord::Schema[7.2].define(version: 2024_09_18_200140) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "job_postings_id", null: false
    t.bigint "resume_id", null: false
    t.bigint "cover_letter_id", null: false
    t.string "status"
    t.date "applied_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cover_letter_id"], name: "index_applications_on_cover_letter_id"
    t.index ["job_postings_id"], name: "index_applications_on_job_postings_id"
    t.index ["resume_id"], name: "index_applications_on_resume_id"
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "job_postings_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_postings_id"], name: "index_bookmarks_on_job_postings_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cover_letters", force: :cascade do |t|
    t.text "content"
    t.bigint "resume_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id"], name: "index_cover_letters_on_resume_id"
  end

  create_table "educations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "school"
    t.string "discipline"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_educations_on_user_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "company"
    t.string "role"
    t.date "start_date"
    t.date "end_date"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "job_postings", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "role_id", null: false
    t.bigint "company_id", null: false
    t.string "salary"
    t.string "wage"
    t.date "posted_date"
    t.text "requirements"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_job_postings_on_company_id"
    t.index ["role_id"], name: "index_job_postings_on_role_id"
  end

  create_table "resume_educations", force: :cascade do |t|
    t.bigint "resume_id", null: false
    t.bigint "education_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["education_id"], name: "index_resume_educations_on_education_id"
    t.index ["resume_id"], name: "index_resume_educations_on_resume_id"
  end

  create_table "resume_experiences", force: :cascade do |t|
    t.bigint "resume_id", null: false
    t.bigint "experience_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experience_id"], name: "index_resume_experiences_on_experience_id"
    t.index ["resume_id"], name: "index_resume_experiences_on_resume_id"
  end

  create_table "resume_skills", force: :cascade do |t|
    t.bigint "resume_id", null: false
    t.bigint "skill_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id"], name: "index_resume_skills_on_resume_id"
    t.index ["skill_id"], name: "index_resume_skills_on_skill_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_resumes_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_roles_on_company_id"
    t.index ["user_id"], name: "index_roles_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_skills_on_user_id"
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
    t.string "address"
    t.string "phone_number"
    t.date "dob"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "watchings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "job_postings_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_postings_id"], name: "index_watchings_on_job_postings_id"
    t.index ["user_id"], name: "index_watchings_on_user_id"
  end

  add_foreign_key "applications", "cover_letters"
  add_foreign_key "applications", "job_postings", column: "job_postings_id"
  add_foreign_key "applications", "resumes"
  add_foreign_key "applications", "users"
  add_foreign_key "bookmarks", "job_postings", column: "job_postings_id"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "cover_letters", "resumes"
  add_foreign_key "educations", "users"
  add_foreign_key "experiences", "users"
  add_foreign_key "job_postings", "companies"
  add_foreign_key "job_postings", "roles"
  add_foreign_key "resume_educations", "educations"
  add_foreign_key "resume_educations", "resumes"
  add_foreign_key "resume_experiences", "experiences"
  add_foreign_key "resume_experiences", "resumes"
  add_foreign_key "resume_skills", "resumes"
  add_foreign_key "resume_skills", "skills"
  add_foreign_key "resumes", "users"
  add_foreign_key "roles", "companies"
  add_foreign_key "roles", "users"
  add_foreign_key "skills", "users"
  add_foreign_key "watchings", "job_postings", column: "job_postings_id"
  add_foreign_key "watchings", "users"
end
