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

ActiveRecord::Schema.define(version: 20171124230404) do

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.text "body"
    t.integer "micropost_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parent_id"
    t.index ["micropost_id"], name: "index_comments_on_micropost_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "communities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.string "description"
    t.integer "user_id"
    t.index ["cached_votes_down"], name: "index_communities_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_communities_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_communities_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_communities_on_cached_votes_up"
    t.index ["cached_weighted_average"], name: "index_communities_on_cached_weighted_average"
    t.index ["cached_weighted_score"], name: "index_communities_on_cached_weighted_score"
    t.index ["cached_weighted_total"], name: "index_communities_on_cached_weighted_total"
  end

  create_table "microposts", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
    t.string "title"
    t.string "genre"
    t.string "artist"
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.integer "community_id"
    t.index ["cached_votes_down"], name: "index_microposts_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_microposts_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_microposts_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_microposts_on_cached_votes_up"
    t.index ["cached_weighted_average"], name: "index_microposts_on_cached_weighted_average"
    t.index ["cached_weighted_score"], name: "index_microposts_on_cached_weighted_score"
    t.index ["cached_weighted_total"], name: "index_microposts_on_cached_weighted_total"
    t.index ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_microposts_on_user_id"
  end

  create_table "microposts_playlists", id: false, force: :cascade do |t|
    t.integer "playlist_id", null: false
    t.integer "micropost_id", null: false
  end

  create_table "playlists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "polycoms", force: :cascade do |t|
    t.string "commentable_type"
    t.integer "commentable_id"
    t.integer "user_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.index ["cached_votes_down"], name: "index_polycoms_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_polycoms_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_polycoms_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_polycoms_on_cached_votes_up"
    t.index ["cached_weighted_average"], name: "index_polycoms_on_cached_weighted_average"
    t.index ["cached_weighted_score"], name: "index_polycoms_on_cached_weighted_score"
    t.index ["cached_weighted_total"], name: "index_polycoms_on_cached_weighted_total"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.binary "spot_hash"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.string "votable_type"
    t.integer "votable_id"
    t.string "voter_type"
    t.integer "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

end
