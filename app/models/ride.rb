class Ride < ApplicationRecord
  belongs_to :customer
  belongs_to :cab

  validates :customer_id, :cab_id, :source, :destination, :cost, presence: true
end
