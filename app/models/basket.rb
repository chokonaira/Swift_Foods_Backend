class Basket < ApplicationRecord
  belongs_to :basket_item
  belongs_to :product
  belongs_to :user
  validates :delivery_address, presence: true
end
