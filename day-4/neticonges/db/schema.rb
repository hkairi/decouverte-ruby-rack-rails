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

ActiveRecord::Schema.define(version: 20171012124742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "demandes", force: :cascade do |t|
    t.bigint "utilisateur_id"
    t.date "debut"
    t.date "fin"
    t.string "nb_jours"
    t.string "type_conges"
    t.string "motif"
    t.boolean "acceptee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["utilisateur_id"], name: "index_demandes_on_utilisateur_id"
  end

  create_table "utilisateurs", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.string "email"
    t.string "telephone"
    t.string "fonction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "demandes", "utilisateurs"
end
