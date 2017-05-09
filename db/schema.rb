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

ActiveRecord::Schema.define(version: 20170508041123536392) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "phobos_db_checkpoint_events", id: :serial, force: :cascade do |t|
    t.string "topic"
    t.string "group_id"
    t.string "entity_id"
    t.datetime "event_time"
    t.string "event_type"
    t.string "event_version"
    t.string "checksum"
    t.json "payload"
    t.datetime "created_at"
    t.index ["checksum"], name: "index_phobos_db_checkpoint_events_on_checksum"
    t.index ["entity_id"], name: "index_phobos_db_checkpoint_events_on_entity_id"
    t.index ["event_time", "created_at"], name: "phobos_events_event_time_created_at_desc_nulls_last_idx", order: { event_time: :desc, created_at: :desc }
    t.index ["event_time"], name: "index_phobos_db_checkpoint_events_on_event_time"
    t.index ["event_type"], name: "index_phobos_db_checkpoint_events_on_event_type"
    t.index ["event_version"], name: "index_phobos_db_checkpoint_events_on_event_version"
    t.index ["group_id"], name: "index_phobos_db_checkpoint_events_on_group_id"
    t.index ["topic", "group_id", "checksum"], name: "index_phobos_db_checkpoint_events_on_topic_group_id_checksum"
    t.index ["topic"], name: "index_phobos_db_checkpoint_events_on_topic"
  end

  create_table "phobos_db_checkpoint_failures", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.string "topic"
    t.string "group_id"
    t.string "entity_id"
    t.datetime "event_time"
    t.string "event_type"
    t.string "event_version"
    t.string "checksum"
    t.json "payload"
    t.json "metadata"
    t.string "error_class"
    t.string "error_message"
    t.json "error_backtrace"
    t.index ["checksum"], name: "index_phobos_db_checkpoint_failures_on_checksum"
    t.index ["created_at"], name: "index_phobos_db_checkpoint_failures_on_created_at"
    t.index ["entity_id"], name: "index_phobos_db_checkpoint_failures_on_entity_id"
    t.index ["event_time", "created_at"], name: "phobos_failures_event_time_created_at_desc_nulls_last_idx", order: { event_time: :desc, created_at: :desc }
    t.index ["event_time"], name: "index_phobos_db_checkpoint_failures_on_event_time"
    t.index ["event_type"], name: "index_phobos_db_checkpoint_failures_on_event_type"
    t.index ["event_version"], name: "index_phobos_db_checkpoint_failures_on_event_version"
    t.index ["group_id"], name: "index_phobos_db_checkpoint_failures_on_group_id"
    t.index ["topic"], name: "index_phobos_db_checkpoint_failures_on_topic"
  end

end
