class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :find_user
    before_action :initialize_cart

    private

    def find_user
        @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def initialize_cart
      if session[:cart_id]
        @cart = Cart.find(session[:cart_id])
      else
        @cart = Cart.create
        session[:cart_id] = @cart.id
      end
    end

    def require_login
        find_user
        if @current_user.nil?
            flash[:result_text] = 'You must be logged in to do that!'
            redirect_to root_path
        end
    end
end
