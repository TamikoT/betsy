class Order < ApplicationRecord
  validates :id, presence: true
  validates :status, presence: true

  has_many :user_orders
  has_many :product_orders
end
