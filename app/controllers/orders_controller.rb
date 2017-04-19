class OrdersController < ApplicationController
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
    @order = Order.find_by_id(params[:id].to_i)
  end

  private

  def order_params
    return params.require(:order).permit(:status)
  end
end
