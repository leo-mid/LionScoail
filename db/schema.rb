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

ActiveRecord::Schema[8.1].define(version: 2024_12_06_154038) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "abouts", force: :cascade do |t|
    t.text "buttom"
    t.text "change"
    t.datetime "created_at", null: false
    t.text "githubtitle"
    t.boolean "hidden"
    t.text "linkgithub"
    t.text "list1"
    t.text "list2"
    t.text "list3"
    t.string "site"
    t.string "title"
    t.text "toppara"
    t.datetime "updated_at", null: false
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "announcements", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.boolean "hidden"
    t.string "site"
    t.string "text"
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.bigint "post_id"
    t.string "site"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "video_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
    t.index ["video_id"], name: "index_comments_on_video_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "receiver_id"
    t.integer "sender_id"
    t.datetime "updated_at", null: false
  end

  create_table "credits", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "for"
    t.bigint "movie_id"
    t.text "person"
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_credits_on_movie_id"
  end

  create_table "disables", force: :cascade do |t|
    t.boolean "about"
    t.boolean "chatrooms"
    t.boolean "conversationdisable"
    t.boolean "credit"
    t.boolean "error"
    t.boolean "expense"
    t.boolean "forums"
    t.boolean "homedisable"
    t.boolean "lionfianace"
    t.boolean "lionsocial"
    t.boolean "movie"
    t.boolean "moviemaker"
    t.boolean "myaccont"
    t.boolean "payment"
    t.boolean "picturescene"
    t.boolean "postdisable"
    t.boolean "scene"
    t.boolean "tutorial"
    t.boolean "userdisable"
    t.boolean "video"
  end

  create_table "errors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "error"
    t.boolean "resolved"
    t.string "site"
    t.datetime "updated_at", null: false
  end

  create_table "forums", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "question"
    t.string "slug"
    t.string "title"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["slug"], name: "index_forums_on_slug", unique: true
    t.index ["user_id"], name: "index_forums_on_user_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.datetime "created_at"
    t.string "scope"
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "conversation_id"
    t.datetime "created_at", null: false
    t.boolean "read", default: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "author"
    t.datetime "created_at", precision: nil, null: false
    t.string "name"
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_movies_on_user_id"
  end

  create_table "picturescenes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "movie_id"
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_picturescenes_on_movie_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "followed_id"
    t.integer "follower_id"
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "room_messages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "message"
    t.bigint "room_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["room_id"], name: "index_room_messages_on_room_id"
    t.index ["user_id"], name: "index_room_messages_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_rooms_on_name", unique: true
  end

  create_table "scenes", force: :cascade do |t|
    t.string "actor"
    t.text "content"
    t.datetime "created_at", precision: nil, null: false
    t.bigint "movie_id"
    t.string "name"
    t.datetime "updated_at", precision: nil, null: false
    t.index ["movie_id"], name: "index_scenes_on_movie_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at", precision: nil
    t.datetime "reset_password_sent_at", precision: nil
    t.string "reset_password_token"
    t.string "role"
    t.string "slug"
    t.datetime "updated_at", null: false
    t.string "username", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "length"
    t.string "link"
    t.text "resource"
    t.text "title"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "comments", "videos"
  add_foreign_key "credits", "movies"
  add_foreign_key "forums", "users"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "movies", "users"
  add_foreign_key "picturescenes", "movies"
  add_foreign_key "posts", "users"
  add_foreign_key "room_messages", "rooms"
  add_foreign_key "room_messages", "users"
  add_foreign_key "scenes", "movies"
end
