class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :worker_profile_tag
end
