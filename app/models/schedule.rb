class Schedule < ApplicationRecord
  belongs_to :tenant
  belongs_to :manicurist, inverse_of: :schedules
  accepts_nested_attributes_for :manicurist

has_many :bookings, inverse_of: :schedules
accepts_nested_attributes_for :bookings
validates :start, uniqueness: { scope: :manicurist_id, message: "You have already made this time available" }
end
