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

ActiveRecord::Schema.define(version: 20171010151341) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "commandes", force: :cascade do |t|
    t.date "date"
    t.bigint "utilisateur_id"
    t.bigint "plat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plat_id"], name: "index_commandes_on_plat_id"
    t.index ["utilisateur_id"], name: "index_commandes_on_utilisateur_id"
  end

  create_table "plats", force: :cascade do |t|
    t.string "nom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
  end

  create_table "utilisateurs", force: :cascade do |t|
    t.string "email"
    t.string "nom"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "commandes", "plats"
  add_foreign_key "commandes", "utilisateurs"
end
