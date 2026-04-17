class User < ApplicationRecord
  has_secure_password
  belongs_to :tenant


  has_many :sessions, dependent: :destroy
  has_many :bookings, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :first_name, :last_name, presence: true

  validates :email_address, presence: true, uniqueness: { case_sensitive: false }



  # roles enum maps to a string column in the database
  # enum role: { admin: "admin", user: "user" }
  def full_names
    "#{first_name} #{last_name}"
  end

  ROLES = %w[admin salon_admin customer].freeze

  def admin?
    role == "admin"
  end
  def customer?
    role == "customer"
  end
  def set_default_role
    self.role ||= "customer"
  end
end
