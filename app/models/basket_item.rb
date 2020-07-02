class BasketItem < ApplicationRecord
  belongs_to :basket
  belongs_to :product
  validates :quantity, presence: true

end
