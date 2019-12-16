class Cab < ApplicationRecord
  has_many :rides
  
  validates :name, :latitude, :longitude, :color, presence: true
  reverse_geocoded_by :latitude, :longitude, :address => :address
  after_validation :reverse_geocode
end
