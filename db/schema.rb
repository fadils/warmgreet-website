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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140424040024) do

  create_table "activity_items", :force => true do |t|
    t.integer  "performer_id"
    t.string   "performer_type"
    t.string   "event"
    t.integer  "target_id"
    t.string   "target_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "activity_items", ["owner_id", "owner_type", "created_at"], :name => "index_activity_items_on_owner_id_and_owner_type_and_created_at"

  create_table "categories", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cities", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "state_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  add_index "cities", ["slug"], :name => "index_cities_on_slug", :unique => true
  add_index "cities", ["state_id"], :name => "index_cities_on_state_id"

  create_table "connections", :force => true do |t|
    t.integer  "subscriber_id"
    t.string   "subscriber_type"
    t.integer  "publisher_id"
    t.string   "publisher_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "connections", ["publisher_id", "publisher_type"], :name => "index_connections_on_publisher_id_and_publisher_type"

  create_table "countries", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "state_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  add_index "countries", ["slug"], :name => "index_countries_on_slug", :unique => true
  add_index "countries", ["state_id"], :name => "index_countries_on_state_id"

  create_table "customers", :force => true do |t|
    t.string   "username"
    t.string   "password_digest",                       :null => false
    t.string   "email",                                 :null => false
    t.text     "biography"
    t.integer  "merchant_number"
    t.string   "gender"
    t.string   "location"
    t.boolean  "admin",              :default => false
    t.string   "session_token",                         :null => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "slug"
    t.boolean  "activated",          :default => false
    t.string   "auth_token"
  end

  create_table "favorites", :force => true do |t|
    t.integer  "user_id",     :null => false
    t.integer  "merchant_id", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "favorites", ["merchant_id"], :name => "index_favorites_on_merchant_id"
  add_index "favorites", ["user_id"], :name => "index_favorites_on_user_id"

  create_table "follows", :force => true do |t|
    t.integer  "follower_id", :null => false
    t.integer  "followed_id", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "follows", ["followed_id"], :name => "index_follows_on_followed_id"
  add_index "follows", ["follower_id"], :name => "index_follows_on_follower_id"

  create_table "merchants", :force => true do |t|
    t.string   "name",                                 :null => false
    t.string   "website"
    t.string   "price"
    t.string   "phone"
    t.string   "street"
    t.string   "zip"
    t.boolean  "open",               :default => true
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.integer  "avg_rtg"
    t.integer  "country_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "slug"
  end

  add_index "merchants", ["country_id"], :name => "index_merchants_on_country_id"
  add_index "merchants", ["slug"], :name => "index_merchants_on_slug", :unique => true

  create_table "pg_search_documents", :force => true do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "posts", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "replies", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "restaurants", :force => true do |t|
    t.string   "name",                                 :null => false
    t.string   "website"
    t.string   "price"
    t.string   "phone"
    t.string   "street",                               :null => false
    t.string   "zip"
    t.boolean  "open",               :default => true
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.integer  "city_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "slug"
  end

  add_index "restaurants", ["city_id"], :name => "index_restaurants_on_city_id"
  add_index "restaurants", ["slug"], :name => "index_restaurants_on_slug", :unique => true

  create_table "reviews", :force => true do |t|
    t.string   "title",                 :null => false
    t.text     "body",                  :null => false
    t.integer  "user_id",               :null => false
    t.integer  "merchant_id",           :null => false
    t.integer  "rating",                :null => false
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "storypic_file_name"
    t.string   "storypic_content_type"
    t.integer  "storypic_file_size"
    t.datetime "storypic_updated_at"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
  end

  add_index "reviews", ["merchant_id"], :name => "index_reviews_on_merchant_id"
  add_index "reviews", ["user_id"], :name => "index_reviews_on_user_id"

  create_table "states", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tags", :force => true do |t|
    t.integer  "category_id", :null => false
    t.integer  "merchant_id", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "tags", ["category_id"], :name => "index_tags_on_category_id"
  add_index "tags", ["merchant_id"], :name => "index_tags_on_merchant_id"

  create_table "usercategories", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "usermerchants", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",                              :null => false
    t.string   "password_digest",                       :null => false
    t.string   "email",                                 :null => false
    t.text     "biography"
    t.integer  "age"
    t.string   "gender"
    t.string   "location"
    t.boolean  "admin",              :default => false
    t.string   "session_token",                         :null => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "slug"
    t.boolean  "activated",          :default => false
    t.string   "auth_token"
  end

  add_index "users", ["auth_token"], :name => "index_users_on_auth_token"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["provider"], :name => "index_users_on_provider"
  add_index "users", ["session_token"], :name => "index_users_on_session_token"
  add_index "users", ["slug"], :name => "index_users_on_slug", :unique => true
  add_index "users", ["uid"], :name => "index_users_on_uid"
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  create_table "vote_tags", :force => true do |t|
    t.integer  "vote_id",    :null => false
    t.integer  "review_id",  :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "vote_tags", ["review_id"], :name => "index_vote_tags_on_review_id"
  add_index "vote_tags", ["user_id"], :name => "index_vote_tags_on_user_id"
  add_index "vote_tags", ["vote_id"], :name => "index_vote_tags_on_vote_id"

  create_table "votes", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
