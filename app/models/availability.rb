class Availability < ApplicationRecord
  belongs_to :worker_profile
  validates :day, presence: true
  validates :day, inclusion: 0..6
  validates :from, presence: true
  validates :to, presence: true
end

# create_table "availabilities", force: :cascade do |t|
#   t.integer "day"
#   t.time "from"
#   t.time "to"
#   t.bigint "worker_profile_id", null: false
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
#   t.index ["worker_profile_id"], name: "index_availabilities_on_worker_profile_id"
# end
