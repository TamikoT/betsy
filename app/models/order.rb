class Order < ApplicationRecord
  validates :status, presence: true, inclusion: { in: %w(pending paid complete cancelled)}

  has_many :product_orders
  has_many :products, through: :product_orders

  has_many :user_orders
  has_many :users, through: :user_orders

  def subtotal
    sum = 0.00
    @cart.product_orders.each do |item|
      sum += Product.find_by_id(item.product_id).price
    end
  end
end
