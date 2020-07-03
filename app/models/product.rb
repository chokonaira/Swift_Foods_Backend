class Product < ApplicationRecord
  belongs_to :category
  has_many :basket_items
  has_many :baskets, through: :basket_items
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :delivery_fee, presense: true
  validates :category_id, presence: true
end
