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

ActiveRecord::Schema[7.0].define(version: 2024_04_28_153901) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "background_migration_jobs", force: :cascade do |t|
    t.bigint "migration_id", null: false
    t.bigint "min_value", null: false
    t.bigint "max_value", null: false
    t.integer "batch_size", null: false
    t.integer "sub_batch_size", null: false
    t.integer "pause_ms", null: false
    t.datetime "started_at"
    t.datetime "finished_at"
    t.string "status", default: "enqueued", null: false
    t.integer "max_attempts", null: false
    t.integer "attempts", default: 0, null: false
    t.string "error_class"
    t.string "error_message"
    t.string "backtrace", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["migration_id", "finished_at"], name: "index_background_migration_jobs_on_finished_at"
    t.index ["migration_id", "max_value"], name: "index_background_migration_jobs_on_max_value"
    t.index ["migration_id", "status", "updated_at"], name: "index_background_migration_jobs_on_updated_at"
  end

  create_table "background_migrations", force: :cascade do |t|
    t.bigint "parent_id"
    t.string "migration_name", null: false
    t.jsonb "arguments", default: [], null: false
    t.string "batch_column_name", null: false
    t.bigint "min_value", null: false
    t.bigint "max_value", null: false
    t.bigint "rows_count"
    t.integer "batch_size", null: false
    t.integer "sub_batch_size", null: false
    t.integer "batch_pause", null: false
    t.integer "sub_batch_pause_ms", null: false
    t.integer "batch_max_attempts", null: false
    t.string "status", default: "enqueued", null: false
    t.string "shard"
    t.boolean "composite", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["migration_name", "arguments", "shard"], name: "index_background_migrations_on_unique_configuration", unique: true
  end

  create_table "background_schema_migrations", force: :cascade do |t|
    t.bigint "parent_id"
    t.string "migration_name", null: false
    t.string "table_name", null: false
    t.string "definition", null: false
    t.string "status", default: "enqueued", null: false
    t.string "shard"
    t.boolean "composite", default: false, null: false
    t.integer "statement_timeout"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.integer "max_attempts", null: false
    t.integer "attempts", default: 0, null: false
    t.string "error_class"
    t.string "error_message"
    t.string "backtrace", array: true
    t.string "connection_class_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["migration_name", "shard"], name: "index_background_schema_migrations_on_unique_configuration", unique: true
  end

  create_table "badhabitlists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_badhabitlists_on_user_id"
  end

  create_table "badhabits", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "reason"
    t.text "initiate"
    t.string "priority"
    t.text "obstacles"
    t.string "current_status"
    t.bigint "badhabitlist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["badhabitlist_id"], name: "index_badhabits_on_badhabitlist_id"
  end

  create_table "bucketlistitems", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "obstacles"
    t.text "initiate"
    t.string "priority"
    t.string "current_status"
    t.bigint "bucketlist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bucketlist_id"], name: "index_bucketlistitems_on_bucketlist_id"
  end

  create_table "bucketlists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bucketlists_on_user_id"
  end

  create_table "careergoallists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_careergoallists_on_user_id"
  end

  create_table "careergoals", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "obstacle"
    t.text "initiate"
    t.string "priority"
    t.string "current_status"
    t.bigint "careergoallist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["careergoallist_id"], name: "index_careergoals_on_careergoallist_id"
  end

  create_table "currentlegacies", force: :cascade do |t|
    t.text "memorialized"
    t.text "epitaph"
    t.text "remembered_for"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_currentlegacies_on_user_id"
  end

  create_table "currentlegacydisconnects", force: :cascade do |t|
    t.boolean "pleased"
    t.text "reason"
    t.text "missing"
    t.bigint "currentlegacy_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currentlegacy_id"], name: "index_currentlegacydisconnects_on_currentlegacy_id"
  end

  create_table "dreamlegacies", force: :cascade do |t|
    t.text "memorialized"
    t.text "epitaph"
    t.text "remembered_for"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_dreamlegacies_on_user_id"
  end

  create_table "dreamlegacysteps", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "obstacles"
    t.text "initiate"
    t.string "current_status"
    t.bigint "dreamlegacy_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dreamlegacy_id"], name: "index_dreamlegacysteps_on_dreamlegacy_id"
  end

  create_table "dreamlifecomponents", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "priority"
    t.text "obstacles"
    t.text "initiate"
    t.string "current_status"
    t.bigint "dreamlifelist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dreamlifelist_id"], name: "index_dreamlifecomponents_on_dreamlifelist_id"
  end

  create_table "dreamlifelists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_dreamlifelists_on_user_id"
  end

  create_table "dreamlists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_dreamlists_on_user_id"
  end

  create_table "dreams", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "obstacles"
    t.text "initiate"
    t.string "priority"
    t.string "current_status"
    t.bigint "dreamlist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dreamlist_id"], name: "index_dreams_on_dreamlist_id"
  end

  create_table "endgames", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "obstacles"
    t.text "initiate"
    t.string "current_status"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_endgames_on_user_id"
  end

  create_table "experiments", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "obstacles"
    t.text "initiate"
    t.string "priority"
    t.string "current_status"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_experiments_on_user_id"
  end

  create_table "familygoallists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_familygoallists_on_user_id"
  end

  create_table "familygoals", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "obstacles"
    t.text "initiate"
    t.string "priority"
    t.string "current_status"
    t.bigint "familygoallist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["familygoallist_id"], name: "index_familygoals_on_familygoallist_id"
  end

  create_table "financialgoallists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_financialgoallists_on_user_id"
  end

  create_table "financialgoals", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "obstacles"
    t.text "initiate"
    t.string "priority"
    t.string "current_status"
    t.bigint "financialgoallist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["financialgoallist_id"], name: "index_financialgoals_on_financialgoallist_id"
  end

  create_table "financialsituations", force: :cascade do |t|
    t.boolean "happy"
    t.text "summary"
    t.text "obstacle"
    t.text "initiate"
    t.text "priority"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_financialsituations_on_user_id"
  end

  create_table "futureregretlists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_futureregretlists_on_user_id"
  end

  create_table "futureregrets", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "action"
    t.string "priority"
    t.text "root_cause"
    t.text "obstacles"
    t.text "prevention"
    t.bigint "futureregretlist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["futureregretlist_id"], name: "index_futureregrets_on_futureregretlist_id"
  end

  create_table "gratefulfors", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "gratefullist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gratefullist_id"], name: "index_gratefulfors_on_gratefullist_id"
  end

  create_table "gratefullists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_gratefullists_on_user_id"
  end

  create_table "healthgoallists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_healthgoallists_on_user_id"
  end

  create_table "healthgoals", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "obstacles"
    t.text "initiate"
    t.string "priority"
    t.string "current_status"
    t.bigint "healthgoallist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["healthgoallist_id"], name: "index_healthgoals_on_healthgoallist_id"
  end

  create_table "mistakelists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_mistakelists_on_user_id"
  end

  create_table "mistakes", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "root_cause"
    t.text "prevention_later"
    t.text "lesson"
    t.boolean "closure"
    t.text "achieve_closure"
    t.bigint "mistakelist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mistakelist_id"], name: "index_mistakes_on_mistakelist_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "relationship"
    t.text "blockage"
    t.text "solution"
    t.string "priority"
    t.string "current_status"
    t.bigint "peoplemissed_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["peoplemissed_id"], name: "index_people_on_peoplemissed_id"
  end

  create_table "peoplemisseds", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_peoplemisseds_on_user_id"
  end

  create_table "pghero_query_stats", force: :cascade do |t|
    t.text "database"
    t.text "user"
    t.text "query"
    t.bigint "query_hash"
    t.float "total_time"
    t.bigint "calls"
    t.datetime "captured_at", precision: nil
    t.index ["database", "captured_at"], name: "index_pghero_query_stats_on_database_and_captured_at"
  end

  create_table "pghero_space_stats", force: :cascade do |t|
    t.text "database"
    t.text "schema"
    t.text "relation"
    t.bigint "size"
    t.datetime "captured_at", precision: nil
    t.index ["database", "captured_at"], name: "index_pghero_space_stats_on_database_and_captured_at"
  end

  create_table "polylistitems", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "priority"
    t.text "obstacles"
    t.text "initiate"
    t.string "current_status"
    t.string "list_item_type", null: false
    t.bigint "list_item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_item_type", "list_item_id"], name: "index_polylistitems_on_list_item"
  end

  create_table "polypriorities", force: :cascade do |t|
    t.string "level"
    t.string "priority_type", null: false
    t.bigint "priority_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["priority_type", "priority_id"], name: "index_polypriorities_on_priority"
  end

  create_table "polytimings", force: :cascade do |t|
    t.string "status"
    t.string "era_type", null: false
    t.bigint "era_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["era_type", "era_id"], name: "index_polytimings_on_era"
  end

  create_table "publicgoallists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_publicgoallists_on_user_id"
  end

  create_table "publicgoals", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "obstacles"
    t.string "priority"
    t.text "initiate"
    t.string "current_status"
    t.bigint "publicgoallist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publicgoallist_id"], name: "index_publicgoals_on_publicgoallist_id"
  end

  create_table "purposes", force: :cascade do |t|
    t.text "description"
    t.text "initiate"
    t.text "obstacles"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_purposes_on_user_id"
  end

  create_table "regretlists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_regretlists_on_user_id"
  end

  create_table "regrets", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "root_cause"
    t.text "prevention_later"
    t.text "lesson_learned"
    t.text "priority"
    t.boolean "closure"
    t.text "achieve_closure"
    t.bigint "regretlist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["regretlist_id"], name: "index_regrets_on_regretlist_id"
  end

  create_table "relationshipissuelists", force: :cascade do |t|
    t.string "timing"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_relationshipissuelists_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.text "person"
    t.text "relationship"
    t.text "issue"
    t.text "initiate"
    t.text "root_cause"
    t.text "priority"
    t.string "current_status"
    t.bigint "relationshipissuelist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["relationshipissuelist_id"], name: "index_relationships_on_relationshipissuelist_id"
  end

  create_table "traumalists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_traumalists_on_user_id"
  end

  create_table "traumas", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "priority"
    t.text "effects"
    t.text "obstacles"
    t.text "initiate"
    t.string "current_status"
    t.boolean "closure"
    t.text "achieve_closure"
    t.bigint "traumalist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["traumalist_id"], name: "index_traumas_on_traumalist_id"
  end

  create_table "traveldestinations", force: :cascade do |t|
    t.string "location"
    t.string "priority"
    t.text "obstacle"
    t.string "current_status"
    t.text "initiate"
    t.bigint "travellist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["travellist_id"], name: "index_traveldestinations_on_travellist_id"
  end

  create_table "travellists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_travellists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "background_migration_jobs", "background_migrations", column: "migration_id", on_delete: :cascade
  add_foreign_key "background_migrations", "background_migrations", column: "parent_id", on_delete: :cascade
  add_foreign_key "background_schema_migrations", "background_schema_migrations", column: "parent_id", on_delete: :cascade
  add_foreign_key "badhabitlists", "users"
  add_foreign_key "badhabits", "badhabitlists"
  add_foreign_key "bucketlistitems", "bucketlists"
  add_foreign_key "bucketlists", "users"
  add_foreign_key "careergoallists", "users"
  add_foreign_key "careergoals", "careergoallists"
  add_foreign_key "currentlegacies", "users"
  add_foreign_key "currentlegacydisconnects", "currentlegacies"
  add_foreign_key "dreamlegacies", "users"
  add_foreign_key "dreamlegacysteps", "dreamlegacies"
  add_foreign_key "dreamlifecomponents", "dreamlifelists"
  add_foreign_key "dreamlifelists", "users"
  add_foreign_key "dreamlists", "users"
  add_foreign_key "dreams", "dreamlists"
  add_foreign_key "endgames", "users"
  add_foreign_key "experiments", "users"
  add_foreign_key "familygoallists", "users"
  add_foreign_key "familygoals", "familygoallists"
  add_foreign_key "financialgoallists", "users"
  add_foreign_key "financialgoals", "financialgoallists"
  add_foreign_key "financialsituations", "users"
  add_foreign_key "futureregretlists", "users"
  add_foreign_key "futureregrets", "futureregretlists"
  add_foreign_key "gratefulfors", "gratefullists"
  add_foreign_key "gratefullists", "users"
  add_foreign_key "healthgoallists", "users"
  add_foreign_key "healthgoals", "healthgoallists"
  add_foreign_key "mistakelists", "users"
  add_foreign_key "mistakes", "mistakelists"
  add_foreign_key "people", "peoplemisseds"
  add_foreign_key "peoplemisseds", "users"
  add_foreign_key "publicgoallists", "users"
  add_foreign_key "publicgoals", "publicgoallists"
  add_foreign_key "purposes", "users"
  add_foreign_key "regretlists", "users"
  add_foreign_key "regrets", "regretlists"
  add_foreign_key "relationshipissuelists", "users"
  add_foreign_key "relationships", "relationshipissuelists"
  add_foreign_key "traumalists", "users"
  add_foreign_key "traumas", "traumalists"
  add_foreign_key "traveldestinations", "travellists"
  add_foreign_key "travellists", "users"
end
