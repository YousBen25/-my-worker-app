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
  validates :address, presence: true

<<<<<<< HEAD
  def completed?
    confirmation
  end

  def completed!
    self.comfirmation = true
  end
=======
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
>>>>>>> master
end
