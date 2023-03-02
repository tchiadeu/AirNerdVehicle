class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
  validates :start, presence: true
  validates :end, presence: true
  validates :status, presence: true
end
