class Tenant < ApplicationRecord
  has_many :services
  has_many :users
  has_many :manicurists
  has_many :schedules
  has_many :bookings
  has_many :clients

  validates :subdomain, presence: true, uniqueness: true, format: { with: /\A[a-z0-9-]+\z/ }
  validates :email, presence: true,  uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :operating_hours, presence: true
end
