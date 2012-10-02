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

ActiveRecord::Schema.define(:version => 20121001070942) do

  create_table "surveys", :force => true do |t|
    t.integer  "user_id"
    t.hstore   "education_from_facebook"
    t.hstore   "occupation_from_facebook"
    t.string   "education"
    t.string   "occupation"
    t.integer  "age_from_facebook"
    t.string   "age_range"
    t.string   "religion_from_facebook"
    t.string   "religion"
    t.integer  "friends_count_from_facebook"
    t.string   "friends_count_range"
    t.string   "gender_from_facebook"
    t.string   "gender"
    t.string   "name"
    t.string   "annual_salary_range"
    t.string   "relationship_status_from_facebook"
    t.string   "relationship_status"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
