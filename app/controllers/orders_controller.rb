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
  end

  def add_product # passed in from product view
    new_line_item = ProductOrder.new(product_params)
    new_line_item.save!
    redirect_to order_path
  end

  private

  def order_params
    return params.require(:order).permit(:status)
  end

  def product_params
    return params.permit(:product_id, :quantity, :order_id)
  end
end
