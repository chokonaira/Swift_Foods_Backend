class HotelsRestaurant < ApplicationRecord
  has_many :categories
  validates :name, presence: true
  validates :address, presence: true
  validates :image_url
  
end
