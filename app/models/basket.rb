class Basket < ApplicationRecord
  belongs_to :basket_item
  belongs_to :product
  validates :quantity, presence: true
  validates :delivery_address, presence: true
  
end
