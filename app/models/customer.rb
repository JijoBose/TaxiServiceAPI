class Customer < ApplicationRecord
  has_many :rides
  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
