class Order < ApplicationRecord
  validates :status, presence: true, inclusion: { in: %w(pending paid complete cancelled)}

  has_many :product_orders
  has_many :products, through: :product_orders

  has_many :user_orders
  has_many :users, through: :user_orders

  def cart_total
    sum = 0.00
    @cart.product_orders.each do |item|
      quantity = item.quantity
      product = Product.find_by_id(item.product_id)
      sum += product.price * quantity
    end
    return sum
  end
end
