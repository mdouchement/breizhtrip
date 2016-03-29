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

ActiveRecord::Schema.define(version: 20160326105800) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"
  enable_extension "citext"

  create_table "legacies", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "gml_id"
    t.integer  "oid"
    t.string   "search_id"
    t.string   "reference"
    t.string   "titre_courant"
    t.string   "type_dossier"
    t.string   "denomination"
    t.string   "cadre_etude"
    t.string   "affixe_cadre_etude"
    t.string   "date_enquete"
    t.string   "date_bordereau"
    t.string   "nature_dossier"
    t.string   "phase"
    t.string   "destinations"
    t.string   "parties_constituantes_non_etudie"
    t.string   "adresse"
    t.string   "lieu_dit"
    t.string   "commune"
    t.string   "datations_principales"
    t.string   "datations_secondaires"
    t.string   "materiaux_murs"
    t.string   "materiaux_toit"
    t.string   "protection"
    t.string   "dates_protection"
    t.string   "statut"
    t.string   "selection"
    t.string   "aire_etude"
    t.string   "lien_dossier"
    t.string   "lien_image"
    t.string   "date_modif"
    t.string   "geometry_type"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "legacies", ["adresse"], name: "index_legacies_on_adresse", using: :btree
  add_index "legacies", ["commune"], name: "index_legacies_on_commune", using: :btree
  add_index "legacies", ["datations_principales"], name: "index_legacies_on_datations_principales", using: :btree
  add_index "legacies", ["latitude"], name: "index_legacies_on_latitude", using: :btree
  add_index "legacies", ["lieu_dit"], name: "index_legacies_on_lieu_dit", using: :btree
  add_index "legacies", ["longitude"], name: "index_legacies_on_longitude", using: :btree
  add_index "legacies", ["titre_courant"], name: "index_legacies_on_titre_courant", using: :btree

end
