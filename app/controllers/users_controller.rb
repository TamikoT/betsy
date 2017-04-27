class UsersController < ApplicationController
    before_action :require_login, only: [:show]

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def show
        @user = User.find_by(id: params[:id])
        head :not_found if @user.nil?
        @total_earnings = total_earnings(@user)
    end

    def create
        new
        if @user.update(user_params)
            session[:user_id] = @user.id
            redirect_to users_path
        else
            render :new, status: :bad_request
        end
    end

    def update
        @product = Product.find(params[:id])

        if @product.update_attributes(params[:status])
            flash[:notice] = 'Product was successfluffy created.'
        else
            flash[:notice] = 'Error creating product'
        end
    end

    def total_earnings(user)
        total_earnings = 0
        user.products.each do |product|
            product.orders.each do |order|
                if order.status == 'complete'
                    total_earnings += product.price * ProductOrder.find_by(order_id: order.id, product_id: product.id).quantity
                end
            end
        end
        sprintf('%.2f', total_earnings)
    end

    helper_method :total_earnings

    # ~~~~~~~~~~~~~~~~~~~~~~~~ooooooooooooooooooooooo~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    private

    def user_params
        params.require(:user).permit(:username, :email)
    end
end
