class OrdersController < ApplicationController
  before_action :initialize_cart, only: [:show]

  def index
    @orders = Order.all
  end

  def create
    Order.create(order_params)

    redirect_to orders_path
  end

  def new
    @order = Order.new
  end

  def show
    @order = @cart # in ApplicationController
    @sum = cart_total
    @items = cart_quantity
  end

  def add_product # passed in from product view
    new_line_item = ProductOrder.new(product_params)
    new_line_item.save!
    redirect_to order_path
  end

  def update_quantity
    line_item = ProductOrder.find_by_id(product_params[:product_id])
    line_item.quantity = product_params[:quantity]
    line_item.save!
    redirect_to order_path
  end

  private

  def order_params
    return params.require(:order).permit(:status)
  end

  def product_params
    return params.permit(:product_id, :quantity, :order_id)
  end

  def cart_total
    sum = 0.00
    @cart.product_orders.each do |item|
      product = Product.find_by_id(item.product_id)
      sum += product.price * item.quantity
    end
    return sum
  end

  def cart_quantity
    items = 0
    @cart.product_orders.each do |item|
      items += item.quantity
    end
    return items
  end
end
