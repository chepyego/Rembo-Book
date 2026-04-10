class Service < ApplicationRecord
  has_one_attached :image
  has_rich_text :description

  has_many :bookings, inverse_of: :service, dependent: :destroy


  has_many :clients, through: :bookings
  has_many :manicurists, through: :bookings


  validates :title, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 999999.99 }

  scope :search, ->(query) {
    return all if query.blank?

    where("title ILIKE ?", "%#{query}%")
   }
end
