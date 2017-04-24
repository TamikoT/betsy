class Order < ApplicationRecord
  validates :status, presence: true, inclusion: { in: %w(pending paid complete cancelled)}

  has_many :product_orders
  has_many :products, through: :product_orders

  has_many :user_orders
  has_many :users, through: :user_orders

  def add_product(product_params)
    current_item = ProductOrder.find_by(product_id: product_params[:product][:product_id])

    if current_item
      current_item.quantity += product_params[:product][:quantity].to_i
      current_item.save!
    else
      ProductOrder.create(product_id: product_params[:product][:product_id], quantity: product_params[:product][:quantity], order_id: self.id )
    end
  end
end
