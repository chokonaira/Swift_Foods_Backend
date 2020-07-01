class User < ApplicationRecord
  before_create do
    self.password = BCrypt::Password.create(password) if password
  end
  has_many :baskets
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, :uniqueness => true
  validates :password, presence: true, length: { minimum: 2, maximum: 8 }
  validates :phone, presence: true

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && BCrypt::Password.new(user.password)==password
      return user
    end
    nil
  end
end
