class Order < ApplicationRecord
  validates :status, presence: true, inclusion: { in: %w(pending paid complete cancelled)}

  has_many :products, through: :product_order
  has_many :product_orders
  has_many :users, through: :user_orders
  has_many :user_orders

end
