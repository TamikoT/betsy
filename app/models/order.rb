class Order < ApplicationRecord
  validates :status, presence: true, inclusion: { in: %w(pending paid complete cancelled)}

  has_many :product_orders
  has_many :products, through: :product_orders

  has_many :user_orders
  has_many :users, through: :user_orders

  def subtotal
    @cart.product_orders.each do |item|
      item.
    end
  end
end
