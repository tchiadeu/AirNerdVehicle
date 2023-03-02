class Vehicle < ApplicationRecord
  CATEGORIES = ['SF', 'Fantasy', 'Classical', 'Superheroes']
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
  validates :price, presence: true
  validates :city, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  belongs_to :user
  has_many_attached :photos
  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?
end
