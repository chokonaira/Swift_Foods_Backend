class Basket < ApplicationRecord
  has_many :basket_items
  belongs_to :user
  validates :isVerified, presence: true
  validates :delivery_address, presence: true
  
end
