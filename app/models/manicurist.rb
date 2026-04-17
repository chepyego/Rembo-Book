class Manicurist < ApplicationRecord
  belongs_to :user
  belongs_to :tenant

  has_one_attached :manicurist_image
  has_many :bookings, dependent: :destroy, inverse_of: :manicurist
  accepts_nested_attributes_for :bookings

  has_many :services, through: :bookings
  has_many :schedules, dependent: :destroy, inverse_of: :manicurist
  accepts_nested_attributes_for :schedules
end
