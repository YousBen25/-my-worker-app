class WorkerProfile < ApplicationRecord
  belongs_to :user
  has_many :worker_profile_tags
  has_many :tags, through: :worker_profile_tags
  has_many :bookings, through: :worker_profile_tags
  has_many :availabilities
  has_many :reviews, through: :bookings
  has_one_attached :photo
  validates :bio, presence: true
  validates :user_id, presence: true

  def average_score
    return 0 if reviews.count.zero?

    reviews.pluck(:score).sum / reviews.count
  end
end

# create_table "worker_profiles", force: :cascade do |t|
#   t.text "bio"
#   t.bigint "user_id", null: false
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
#   t.index ["user_id"], name: "index_worker_profiles_on_user_id"
# end
