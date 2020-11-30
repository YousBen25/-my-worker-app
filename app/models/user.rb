class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :worker_profile
  has_many :reviews
  has_many :bookings

  validates :first_name, presence: true
  validates :last_name, presence: true
end
