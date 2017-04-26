class Product < ApplicationRecord

    validates :stock, presence: true, numericality: { only_integer: true, allow_nil: true }
    validates :name, presence: true
    validates :price, presence: true, numericality: { greater_than: 0 }

    belongs_to :user
    has_many :reviews

    has_many :product_orders
    has_many :orders, through: :product_orders

    has_many :product_categories
    has_many :categories, through: :product_categories
end
