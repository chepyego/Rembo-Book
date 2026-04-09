class Service < ApplicationRecord
  has_one_attached :image
  has_rich_text :description

  has_many :bookings, inverse_of: :service, dependent: :destroy


  has_many :clients, through: :bookings
  has_many :manicurists, through: :bookings

  validates :title, :price, presence: true

  scope :search, ->(query) {
    return all if query.blank?

    where("title ILIKE ?", "%#{query}%")
   }
end
