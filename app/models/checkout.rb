class Checkout < ApplicationRecord
  belongs_to :basket
  belongs_to :user
  validates :full_name, presence: true
  validates :delivery_address, presence: true
  validates :phone, presence: true
  validates :payment_verified, presence: false



end
