class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true, format: { with: /\A[-\w.]*\z/, message: ': Only accepts letters, numbers, period, hyphens and underscore allowed' }
    validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: 'Email format.' }

    has_many :products
    has_many :user_orders
    has_many :orders, through: :user_orders
    has_many :reviews, through: :products

    def self.from_github(auth_hash)
        user = User.new
        user.username = auth_hash['info']['nickname']
        user.email = auth_hash['info']['email']
        user.oauth_uid = auth_hash['uid']
        user.oauth_provider = 'github'
        user
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
end
