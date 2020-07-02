class Basket < ApplicationRecord
  has_many :basket_items
  belongs_to :user
end
