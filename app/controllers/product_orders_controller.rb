class ProductOrdersController < ApplicationController
  before_action :initialize_cart

  def create
    @cart.add_product(user_params)

    unless @cart.save
      flash[:error] = "There was a problem adding this item to your cart."
    end
    redirect_to order_path
  end

  def destroy
    @cart_item = ProductOrder.find(params[:id])
  end

  private

  def user_params
    params.require(:product_orders).permit(:product_id, :order_id, :quantity)
  end
end
