class Basket < ApplicationRecord
  has_many :basket_items
  has_many :products, through: :basket_items
  has_many :checkouts
  belongs_to :user
end
