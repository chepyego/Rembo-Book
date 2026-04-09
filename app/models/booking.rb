class Booking < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :service

  validates :name, :phone_number, :email, presence: true, if: :guest_booking?

  def guest_booking?
    user.blank?
  end

    scope :upcoming, -> { where("date > ?", Time.zone.now) }
end
