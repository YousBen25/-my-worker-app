class WorkerProfileTag < ApplicationRecord
  belongs_to :worker_profile
  belongs_to :tag
  has_many :bookings
  validates :worker_profile_id, presence: true
  validates :tag_id, presence: true
  validates :rate, presence: true
  validates :rate, numericality: {greater_than_or_equal_to: 1}
end


# create_table "worker_profile_tags", force: :cascade do |t|
#   t.bigint "worker_profile_id", null: false
#   t.bigint "tag_id", null: false
#   t.integer "rate"
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
#   t.index ["tag_id"], name: "index_worker_profile_tags_on_tag_id"
#   t.index ["worker_profile_id"], name: "index_worker_profile_tags_on_worker_profile_id"
# end
