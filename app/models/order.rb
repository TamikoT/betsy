class Order < ApplicationRecord
    validates :status, presence: true, inclusion: { in: %w(pending paid complete cancelled) }
    validates :email_address, presence: true, if: :order_ready?
    validates :mailing_address, presence: true, if: :order_ready?
    validates :card_name, presence: true, if: :order_ready?
    validates :card_expiration, presence: true, if: :order_ready?
    validates :card_cvv, presence: true, if: :order_ready?
    validates :zipcode, presence: true, if: :order_ready?

    has_many :product_orders
    has_many :products, through: :product_orders

    has_many :user_orders
    has_many :users, through: :user_orders

    def order_ready?
        status == 'paid' || 'completed'
    end

    def subtotal
        @cart.product_orders.each do |item|
            item
        end
    end
end
