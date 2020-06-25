class Category < ApplicationRecord
  has_many :products
  belongs_to :hotels_restaurant
  validates :name, presence: true
  validates :hotels_restaurant_id, presence: true
end
