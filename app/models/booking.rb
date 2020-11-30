class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :worker_profile_tag
  validates :user_id, presence: true
  validates :worker_profile_tag_id, presence: true
  validates :description, presence: true

end


# create_table "bookings", force: :cascade do |t|
#   t.bigint "user_id", null: false
#   t.text "description"
#   t.bigint "worker_profile_tag_id", null: false
#   t.boolean "confirmation", default: false
#   t.datetime "date"
#   t.integer "duration"
#   t.integer "price"
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
#   t.index ["user_id"], name: "index_bookings_on_user_id"
#   t.index ["worker_profile_tag_id"], name: "index_bookings_on_worker_profile_tag_id"
# end
