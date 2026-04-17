class Client < ApplicationRecord
  belongs_to :user
  belongs_to :tenant


  has_many :bookings, dependent: :destroy, inverse_of: :client
  accepts_nested_attributes_for :bookings

  has_many :services, through: :bookings
end
