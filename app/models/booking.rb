class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :worker_profile_tag
  delegate :worker_profile, to: :worker_profile_tag
  has_one :review
  validates :description, presence: true
  validates :date, presence: true
  validates :duration, presence: true
  validates :duration,  numericality: {greater_than_or_equal_to: 1}
  validates :price, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 1}

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  before_save :calculate_price

  def calculate_price
    rate = self.worker_profile_tag.rate
    self.price = rate * self.duration
  end
end
