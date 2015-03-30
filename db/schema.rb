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

ActiveRecord::Schema.define(version: 20150330123858) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "body"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "section_id"
  end

  add_index "articles", ["section_id"], name: "index_articles_on_section_id", using: :btree

  create_table "catalog_items", force: :cascade do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "body"
    t.integer  "price"
    t.integer  "position"
    t.integer  "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "catalog_items", ["section_id"], name: "index_catalog_items_on_section_id", using: :btree

  create_table "section_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "section_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "section_anc_desc_idx", unique: true, using: :btree
  add_index "section_hierarchies", ["descendant_id"], name: "section_desc_idx", using: :btree

  create_table "sections", force: :cascade do |t|
    t.integer  "parent_id"
    t.string   "title"
    t.string   "slug"
    t.integer  "position"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "content_model"
  end

  add_foreign_key "articles", "sections"
  add_foreign_key "catalog_items", "sections"
end
