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

ActiveRecord::Schema.define(version: 20180414163110) do

  create_table "age_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_age_groups_on_name", unique: true, using: :btree
  end

  create_table "article_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "introduction",        limit: 65535
    t.text     "body",                limit: 65535
    t.date     "date"
    t.integer  "article_category_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["article_category_id"], name: "index_articles_on_article_category_id", using: :btree
  end

  create_table "caregivers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",            null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address_line_one"
    t.string   "address_line_two"
    t.string   "city"
    t.string   "province"
    t.string   "country"
    t.string   "postal_code"
    t.string   "work_phone"
    t.string   "house_phone"
    t.string   "mobile_phone"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["email"], name: "index_caregivers_on_email", unique: true, using: :btree
  end

  create_table "fae_changes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "changeable_id"
    t.string   "changeable_type"
    t.integer  "user_id"
    t.string   "change_type"
    t.text     "updated_attributes", limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["changeable_id"], name: "index_fae_changes_on_changeable_id", using: :btree
    t.index ["changeable_type"], name: "index_fae_changes_on_changeable_type", using: :btree
    t.index ["user_id"], name: "index_fae_changes_on_user_id", using: :btree
  end

  create_table "fae_files", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "asset"
    t.string   "fileable_type"
    t.integer  "fileable_id"
    t.integer  "file_size"
    t.integer  "position",      default: 0
    t.string   "attached_as"
    t.boolean  "on_stage",      default: true
    t.boolean  "on_prod",       default: false
    t.boolean  "required",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attached_as"], name: "index_fae_files_on_attached_as", using: :btree
    t.index ["fileable_type", "fileable_id"], name: "index_fae_files_on_fileable_type_and_fileable_id", using: :btree
  end

  create_table "fae_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "asset"
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.string   "alt"
    t.string   "caption"
    t.integer  "position",       default: 0
    t.string   "attached_as"
    t.boolean  "on_stage",       default: true
    t.boolean  "on_prod",        default: false
    t.integer  "file_size"
    t.boolean  "required",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attached_as"], name: "index_fae_images_on_attached_as", using: :btree
    t.index ["imageable_type", "imageable_id"], name: "index_fae_images_on_imageable_type_and_imageable_id", using: :btree
  end

  create_table "fae_options", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "time_zone"
    t.string   "colorway"
    t.string   "stage_url"
    t.string   "live_url"
    t.integer  "singleton_guard"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["singleton_guard"], name: "index_fae_options_on_singleton_guard", unique: true, using: :btree
  end

  create_table "fae_roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fae_static_pages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.integer  "position",   default: 0
    t.boolean  "on_stage",   default: true
    t.boolean  "on_prod",    default: false
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["slug"], name: "index_fae_static_pages_on_slug", using: :btree
  end

  create_table "fae_text_areas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "label"
    t.text     "content",          limit: 65535
    t.integer  "position",                       default: 0
    t.boolean  "on_stage",                       default: true
    t.boolean  "on_prod",                        default: false
    t.integer  "contentable_id"
    t.string   "contentable_type"
    t.string   "attached_as"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attached_as"], name: "index_fae_text_areas_on_attached_as", using: :btree
    t.index ["contentable_id"], name: "index_fae_text_areas_on_contentable_id", using: :btree
    t.index ["contentable_type"], name: "index_fae_text_areas_on_contentable_type", using: :btree
    t.index ["on_prod"], name: "index_fae_text_areas_on_on_prod", using: :btree
    t.index ["on_stage"], name: "index_fae_text_areas_on_on_stage", using: :btree
    t.index ["position"], name: "index_fae_text_areas_on_position", using: :btree
  end

  create_table "fae_text_fields", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "contentable_type"
    t.integer  "contentable_id"
    t.string   "attached_as"
    t.string   "label"
    t.string   "content"
    t.integer  "position",         default: 0
    t.boolean  "on_stage",         default: true
    t.boolean  "on_prod",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attached_as"], name: "index_fae_text_fields_on_attached_as", using: :btree
    t.index ["contentable_type", "contentable_id"], name: "index_fae_text_fields_on_contentable_type_and_contentable_id", using: :btree
    t.index ["on_prod"], name: "index_fae_text_fields_on_on_prod", using: :btree
    t.index ["on_stage"], name: "index_fae_text_fields_on_on_stage", using: :btree
    t.index ["position"], name: "index_fae_text_fields_on_position", using: :btree
  end

  create_table "fae_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "role_id"
    t.boolean  "active"
    t.string   "language"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["confirmation_token"], name: "index_fae_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_fae_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_fae_users_on_reset_password_token", unique: true, using: :btree
    t.index ["role_id"], name: "index_fae_users_on_role_id", using: :btree
    t.index ["unlock_token"], name: "index_fae_users_on_unlock_token", unique: true, using: :btree
  end

  create_table "patient_questionnaires", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "patient_id",       null: false
    t.integer  "questionnaire_id", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["patient_id"], name: "index_patient_questionnaires_on_patient_id", using: :btree
    t.index ["questionnaire_id"], name: "index_patient_questionnaires_on_questionnaire_id", using: :btree
  end

  create_table "patients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name",                                  null: false
    t.string   "last_name",                                   null: false
    t.decimal  "weight",                       precision: 10
    t.date     "birthdate"
    t.integer  "age_group_id",                                null: false
    t.text     "caregiver_note", limit: 65535
    t.text     "doctor_note",    limit: 65535
    t.text     "hidden_note",    limit: 65535
    t.integer  "caregiver_id",                                null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["age_group_id"], name: "index_patients_on_age_group_id", using: :btree
    t.index ["caregiver_id"], name: "index_patients_on_caregiver_id", using: :btree
  end

  create_table "questionnaire_responses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "questionnaire_id", null: false
    t.integer  "patient_id",       null: false
    t.date     "date",             null: false
    t.json     "response",         null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["patient_id", "date"], name: "by_patient_and_date", using: :btree
    t.index ["patient_id"], name: "index_questionnaire_responses_on_patient_id", using: :btree
    t.index ["questionnaire_id"], name: "index_questionnaire_responses_on_questionnaire_id", using: :btree
  end

  create_table "questionnaires", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",         null: false
    t.string   "file_path",    null: false
    t.integer  "age_group_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["age_group_id"], name: "index_questionnaires_on_age_group_id", using: :btree
    t.index ["file_path"], name: "index_questionnaires_on_file_path", unique: true, using: :btree
    t.index ["name"], name: "index_questionnaires_on_name", unique: true, using: :btree
  end

  add_foreign_key "articles", "article_categories"
end
