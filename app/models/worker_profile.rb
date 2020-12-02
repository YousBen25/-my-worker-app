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
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_address,
  against: [ :address ],
  using: {
    tsearch: { prefix: true }
  }

  pg_search_scope :search_by_job,
  against: [],
  associated_against: {
    tags: [:name]
  },

  using: {
    tsearch: {prefix: true}
  }

  def average_score
    return 0 if reviews.count.zero?

    reviews.pluck(:score).sum / reviews.count
  end

  def calculate_availabilities
    working_hash = {}
    self.availabilities.each do |availability|
      if working_hash[availability.day.to_s]
       working_hash[availability.day.to_s] << "#{availability.from.hour}-#{availability.to.hour}"
     else
       working_hash[availability.day.to_s] = ["#{availability.from.hour}-#{availability.to.hour}"]
     end
   end
   working_hash
 end
end

# create_table "worker_profiles", force: :cascade do |t|
#   t.text "bio"
#   t.bigint "user_id", null: false
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
#   t.index ["user_id"], name: "index_worker_profiles_on_user_id"
# end
