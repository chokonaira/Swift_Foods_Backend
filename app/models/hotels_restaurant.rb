class HotelsRestaurant < ApplicationRecord
  has_many :categories
  validates :name, presence: true
  validates :address, presence: true
end
