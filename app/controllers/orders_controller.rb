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

  def add_product # passed in from product#show view
  prev_item = ProductOrder.find_by(product_id: product_params[:product_id], order_id: product_params[:order_id])

    if prev_item
      prev_item.quantity += product_params[:quantity].to_i
      prev_item.save!
    else
      ProductOrder.create!(product_params)
    end

    redirect_to order_path
  end

  def remove_product
    old_line_item = ProductOrder.find_by_id(params[:item_id].to_i)
    old_line_item.destroy!

    redirect_to order_path
  end

  def update_quantity
    line_item = ProductOrder.find_by_id(params[:item_id].to_i)
    line_item.quantity = params[:quantity].to_i
    if line_item.quantity == 0
      line_item.destroy!
    else
      line_item.save!
    end
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
