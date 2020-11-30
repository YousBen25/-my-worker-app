class Tag < ApplicationRecord
  has_many :worker_profile_tags, dependent: :destroy
  has_many :worker_profiles, through: :worker_profile_tags

  validates :name, presence: true
end
