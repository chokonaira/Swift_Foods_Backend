class BasketItem < ApplicationRecord
  belongs_to :basket
  belongs_to :product
  validates :basket_id, presence: true
  validates :product_id, presence: true
  validates :quantity, presence: true

end
