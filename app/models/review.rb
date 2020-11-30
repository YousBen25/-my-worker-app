class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :user
  validates :score, presence: true
  validates :score, inclusion: 1..5
  validates :description, review: true
  validates :booking_id, presence: true
  validates :user_id, presence: true
end


