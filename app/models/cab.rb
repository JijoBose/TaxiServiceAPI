class Cab < ApplicationRecord
  validates :name, :latitude, :longitude, :color, presence: true
end
