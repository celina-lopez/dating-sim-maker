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

ActiveRecord::Schema.define(version: 2021_06_07_041810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chapters", force: :cascade do |t|
    t.bigint "story_id", null: false
    t.integer "order_number", null: false
    t.integer "status", default: 0, null: false
    t.integer "chap_type", default: 0, null: false
    t.string "title", null: false
    t.string "background_image_url"
    t.integer "character_condition"
    t.integer "character_ending"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["story_id"], name: "index_chapters_on_story_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name", null: false
    t.text "biography"
    t.bigint "user_id", null: false
    t.jsonb "details", null: false
    t.jsonb "emotions"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "lines", force: :cascade do |t|
    t.bigint "chapter_id", null: false
    t.text "text", null: false
    t.integer "speakeable_id", null: false
    t.integer "order", null: false
    t.integer "line_type", default: 0, null: false
    t.integer "emotion", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chapter_id"], name: "index_lines_on_chapter_id"
  end

  create_table "options", force: :cascade do |t|
    t.bigint "line_id", null: false
    t.string "answers", default: [], null: false, array: true
    t.integer "weights", default: [], null: false, array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["line_id"], name: "index_options_on_line_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "user_id", null: false
    t.float "love_meter", default: 0.0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_relationships_on_character_id"
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "stories", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.string "uid", null: false
    t.bigint "user_id", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_stories_on_user_id"
  end

  create_table "storycharacters", force: :cascade do |t|
    t.bigint "story_id", null: false
    t.bigint "character_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_storycharacters_on_character_id"
    t.index ["story_id"], name: "index_storycharacters_on_story_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "name"
    t.string "encrypted_password", null: false
    t.string "encrypted_password_iv", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
