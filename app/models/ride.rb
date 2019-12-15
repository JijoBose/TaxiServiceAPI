class Ride < ApplicationRecord
  validates :customer_id, :cab_id, :source, :destination, :cost, :completed, presence: true
end
