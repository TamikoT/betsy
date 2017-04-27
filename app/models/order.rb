class Order < ApplicationRecord
    validates :status, presence: true, inclusion: { in: %w(pending paid complete cancelled) }
    validates :email_address, presence: true, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ }, if: "status == 'paid' || status == 'complete'"
    validates :mailing_address, presence: true, if: "status == 'paid' || status == 'complete'"
    validates :card_name, presence: true, if: "status == 'paid' || status == 'complete'"
    validates :card_expiration, presence: true, if: "status == 'paid' || status == 'complete'"
    validates :card_cvv, presence: true, length: { is: 3 }, if: "status == 'paid' || status == 'complete'"
    validates :zipcode, presence: true, length: { is: 5 }, if: "status == 'paid' || status == 'complete'"
    validates :credit_card, presence: true, format: { with: /\A(^4[0-9]{12}(?:[0-9]{3})?$)|(^5[1-5][0-9]{14}$)\z/ }, if: "status == 'paid' || status == 'complete'"

    has_many :product_orders
    has_many :products, through: :product_orders

    has_many :user_orders
    has_many :users, through: :user_orders

    def subtotal
        @cart.product_orders.each do |item|
            item
        end
    end
end
