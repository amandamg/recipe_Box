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

ActiveRecord::Schema.define(version: 2018_08_31_034846) do

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_comments_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.text "directions"
    t.text "description"
    t.integer "servingSize"
    t.string "timeCook"
    t.string "timePrep"
    t.integer "calories"
    t.string "picture"
    t.text "ingredients"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.string "email"
    t.text "bio"
    t.string "profilePic"
    t.text "favQuote"
    t.text "specialty"
    t.integer "years_exp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
