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

    def edit
        @order = Order.find(session[:order_id])
    end

    def update
        edit
        @order.update(order_params)
        @order.status = 'paid'
        if @order.save
            flash[:result_text] = "Your Order # #{@order.id} has been placed!"

            @order.products.each do |product|
                product.stock -= ProductOrder.find_by(order_id: @order.id, product_id: product.id).quantity
                product.save
            end

            session.delete(:order_id)
            redirect_to root_path
        else
            flash[:result_text] = 'Unable to place order'
            flash[:messages] = @order.errors.messages
            @order.status = 'pending'
            render 'edit'
        end
    end

    def add_product # passed in from product view
        prev_item = ProductOrder.find_by(product_params)
        if prev_item
            flash[:result_text] = "Added #{product_params[:quantity]} more #{Product.find_by(id: product_params[:product_id])} to cart"
            prev_item.quantity += product_params[:quantity].to_i
            prev_item.save!
            redirect_to product_path(prev_item.product_id)
        else
            flash[:status] = :success
            flash[:result_text] = "Successfluffy added #{Product.find_by(id: roduct_params[:product_id])} to cart"
            ProductOrder.create!(product_params)
            redirect_to order_path
        end
    end

    def remove_product
        old_line_item = ProductOrder.find_by_id(params[:item_id].to_i)
        old_line_item.destroy!

        redirect_to order_path
    end

    def update_quantity
        line_item = ProductOrder.find_by_id(params[:item_id].to_i)
        line_item.quantity = params[:quantity].to_i

        # T_T removes product from cart when qty is updated to 0
        if line_item.quantity == 0
            line_item.destroy!
        else
            line_item.save!
        end
        redirect_to order_path
    end

    private

    def order_params
        params.require(:order).permit(:status, :email_address, :mailing_address, :card_name, :card_expiration, :card_cvv, :zipcode)
    end

    def product_params
        params.permit(:product_id, :quantity, :order_id)
    end

    def cart_total
        sum = 0.00
        @cart.product_orders.each do |item|
            product = Product.find_by_id(item.product_id)
            sum += product.price * item.quantity
        end
        sum
    end

    def cart_quantity
        items = 0
        @cart.product_orders.each do |item|
            items += item.quantity
        end
        items
    end
end
