class Category < ApplicationRecord
  has_many :products
  belongs_to :hotels_restaurant
  validates :name, presence: true
end
