class User < ApplicationRecord
  validates :id, presence: true
  validates :username, presence: true
  validates :email, presence: true

  has_many :products
  has_many :user_orders
end
