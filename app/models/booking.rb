class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
  validates :start, presence: true
  validates :end, presence: true
end
