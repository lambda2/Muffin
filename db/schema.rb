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

ActiveRecord::Schema.define(version: 0) do

  create_table "c_42_logins", primary_key: "login_eleve", force: true do |t|
    t.string "nom",                                    null: false
    t.string "prenom",                                 null: false
    t.string "user_icone",           default: "chef"
    t.string "poste"
    t.string "type",       limit: 5, default: "eleve"
    t.string "mail"
    t.text   "picture"
  end

  add_index "c_42_logins", ["login_eleve"], name: "login_eleve", using: :btree
  add_index "c_42_logins", ["login_eleve"], name: "login_eleve_2", unique: true, using: :btree

  create_table "c_42_time", id: false, force: true do |t|
    t.string  "login",                                    null: false
    t.date    "date",                                     null: false
    t.integer "duration", default: 0,                     null: false
    t.string  "poste"
    t.time    "hour",     default: '2000-01-01 00:00:00', null: false
  end

  create_table "c_blame_competences", id: false, force: true do |t|
    t.integer "id_user", null: false
    t.integer "id_comp", null: false
  end

  add_index "c_blame_competences", ["id_comp"], name: "blame_competence_ibfk_2", using: :btree

  create_table "c_categories", primary_key: "id_categorie", force: true do |t|
    t.string "nom",             null: false
    t.string "description"
    t.string "icone_categorie"
  end

  create_table "c_competences", primary_key: "id_competence", force: true do |t|
    t.string  "nom_competence",              null: false
    t.string  "nom_usuel",                   null: false
    t.string  "description"
    t.string  "icone"
    t.integer "type_competence"
    t.integer "expired",         default: 0
  end

  add_index "c_competences", ["nom_competence"], name: "nom", unique: true, using: :btree
  add_index "c_competences", ["type_competence"], name: "type_competence", using: :btree

  create_table "c_drafts", primary_key: "draft_id", force: true do |t|
    t.string    "draft_name",                null: false
    t.text      "draft_content",             null: false
    t.timestamp "draft_date_c"
    t.integer   "draft_author"
    t.integer   "public",        default: 0
    t.integer   "read_count",    default: 0
    t.integer   "draft_views",   default: 0
  end

  add_index "c_drafts", ["draft_author"], name: "draft_author", using: :btree

  create_table "c_drafts_like", id: false, force: true do |t|
    t.integer "id_user_like",  null: false
    t.integer "id_draft_like", null: false
  end

  add_index "c_drafts_like", ["id_draft_like"], name: "id_draft_like", using: :btree

  create_table "c_echanges", id: false, force: true do |t|
    t.integer   "id_demande",                               null: false
    t.integer   "id_propose",                               null: false
    t.timestamp "date"
    t.integer   "competence",                               null: false
    t.string    "resume",     limit: 7, default: "attente"
  end

  add_index "c_echanges", ["competence"], name: "competence", using: :btree
  add_index "c_echanges", ["id_propose"], name: "id_propose", using: :btree

  create_table "c_event", primary_key: "id_event", force: true do |t|
    t.string   "event_name",        null: false
    t.text     "event_description", null: false
    t.datetime "event_date",        null: false
    t.integer  "event_author",      null: false
  end

  add_index "c_event", ["event_author"], name: "event_author", using: :btree

  create_table "c_news", primary_key: "id_news", force: true do |t|
    t.timestamp "date"
    t.text      "text",      null: false
    t.integer   "id_auteur", null: false
  end

  add_index "c_news", ["id_auteur"], name: "id_auteur", using: :btree

  create_table "c_notifications", primary_key: "id_notification", force: true do |t|
    t.integer   "id_user",                 null: false
    t.string    "message",                 null: false
    t.timestamp "date"
    t.boolean   "vu",      default: false
  end

  add_index "c_notifications", ["id_user"], name: "id_user", using: :btree

  create_table "c_quote", primary_key: "id_quote", force: true do |t|
    t.string "icon_quote"
    t.string "text_quote",   null: false
    t.string "author_quote", null: false
  end

  create_table "c_reunion", primary_key: "reunion_id", force: true do |t|
    t.integer  "reunion_competence",               null: false
    t.integer  "reunion_organisateur",             null: false
    t.text     "reunion_texte"
    t.datetime "reunion_date",                     null: false
    t.integer  "reunion_duree"
    t.text     "reunion_lieu"
    t.integer  "reunion_type",         default: 1
  end

  add_index "c_reunion", ["reunion_competence", "reunion_organisateur"], name: "reunion_competence", using: :btree
  add_index "c_reunion", ["reunion_organisateur"], name: "reunion_organisateur", using: :btree
  add_index "c_reunion", ["reunion_type"], name: "reunion_type", using: :btree

  create_table "c_reunion_participe", id: false, force: true do |t|
    t.integer "id_reunion", null: false
    t.integer "id_user",    null: false
    t.integer "feedback"
  end

  add_index "c_reunion_participe", ["id_user"], name: "id_user", using: :btree

  create_table "c_reunion_type", primary_key: "id_type", force: true do |t|
    t.string  "nom_type",                     null: false
    t.string  "description_type",             null: false
    t.string  "icone_type"
    t.integer "role_type",        default: 1
  end

  create_table "c_roles", primary_key: "id_role", force: true do |t|
    t.integer "role_value", null: false
    t.string  "nom_role",   null: false
    t.string  "icone_role"
  end

  add_index "c_roles", ["nom_role"], name: "nom_role", unique: true, using: :btree
  add_index "c_roles", ["role_value"], name: "role_value", using: :btree

  create_table "c_tags", id: false, force: true do |t|
    t.integer "id_competence", null: false
    t.integer "id_categorie",  null: false
  end

  add_index "c_tags", ["id_categorie"], name: "id_categorie", using: :btree

  create_table "c_type_competence", primary_key: "id_type", force: true do |t|
    t.string "nom_type",  null: false
    t.string "desc_type"
  end

  add_index "c_type_competence", ["nom_type"], name: "nom_type", unique: true, using: :btree

  create_table "c_user", force: true do |t|
    t.string  "login",                              null: false
    t.string  "pass",                               null: false
    t.integer "verifie",               default: 0,  null: false
    t.integer "comp_public", limit: 1, default: 1
    t.integer "first_visit",           default: 1
    t.integer "accept_mail",           default: 31, null: false
    t.integer "auths",                 default: 1,  null: false
    t.text    "bio"
  end

  add_index "c_user", ["login"], name: "login", unique: true, using: :btree

  create_table "c_user_competences", id: false, force: true do |t|
    t.integer   "id_user",                           null: false
    t.integer   "id_competence",                     null: false
    t.string    "niveau"
    t.integer   "want_to_learn", default: 0
    t.integer   "want_to_teach", default: 0
    t.string    "wtl_keyword",   default: "general", null: false
    t.timestamp "date_user_c",                       null: false
  end

  add_index "c_user_competences", ["id_competence"], name: "id_competence", using: :btree

end
