create_table "commontator_comments", force: :cascade do |t|
  t.string   "creator_type"
  t.integer  "creator_id"
  t.string   "editor_type"
  t.integer  "editor_id"
  t.integer  "thread_id",                     null: false
  t.text     "body",                          null: false
  t.datetime "deleted_at"
  t.integer  "cached_votes_up",   default: 0
  t.integer  "cached_votes_down", default: 0
  t.datetime "created_at"
  t.datetime "updated_at"
  t.index ["cached_votes_down"], name: "index_commontator_comments_on_cached_votes_down"
  t.index ["cached_votes_up"], name: "index_commontator_comments_on_cached_votes_up"
  t.index ["creator_id", "creator_type", "thread_id"], name: "index_commontator_comments_on_c_id_and_c_type_and_t_id"
  t.index ["thread_id", "created_at"], name: "index_commontator_comments_on_thread_id_and_created_at"
end

create_table "commontator_subscriptions", force: :cascade do |t|
  t.string   "subscriber_type", null: false
  t.integer  "subscriber_id",   null: false
  t.integer  "thread_id",       null: false
  t.datetime "created_at"
  t.datetime "updated_at"
  t.index ["subscriber_id", "subscriber_type", "thread_id"], name: "index_commontator_subscriptions_on_s_id_and_s_type_and_t_id", unique: true
  t.index ["thread_id"], name: "index_commontator_subscriptions_on_thread_id"
end

create_table "commontator_threads", force: :cascade do |t|
  t.string   "commontable_type"
  t.integer  "commontable_id"
  t.datetime "closed_at"
  t.string   "closer_type"
  t.integer  "closer_id"
  t.datetime "created_at"
  t.datetime "updated_at"
  t.index ["commontable_id", "commontable_type"], name: "index_commontator_threads_on_c_id_and_c_type", unique: true
end

create_table "links", force: :cascade do |t|
  t.string   "title"
  t.string   "url"
  t.integer  "user_id"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
  t.index ["user_id"], name: "index_links_on_user_id"
end

create_table "users", force: :cascade do |t|
  t.string   "email",                  default: "", null: false
  t.string   "encrypted_password",     default: "", null: false
  t.string   "reset_password_token"
  t.datetime "reset_password_sent_at"
  t.datetime "remember_created_at"
  t.integer  "sign_in_count",          default: 0,  null: false
  t.datetime "current_sign_in_at"
  t.datetime "last_sign_in_at"
  t.string   "current_sign_in_ip"
  t.string   "last_sign_in_ip"
  t.datetime "created_at",                          null: false
  t.datetime "updated_at",                          null: false
  t.string   "username"
  t.index ["email"], name: "index_users_on_email", unique: true
  t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  t.index ["username"], name: "index_users_on_username", unique: true
end

create_table "votes", force: :cascade do |t|
  t.string   "votable_type"
  t.integer  "votable_id"
  t.string   "voter_type"
  t.integer  "voter_id"
  t.boolean  "vote_flag"
  t.string   "vote_scope"
  t.integer  "vote_weight"
  t.datetime "created_at"
  t.datetime "updated_at"
  t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
end
