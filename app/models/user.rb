class User < ApplicationRecord
  validates :id, presence: true
  validates :username, presence: true
  validates :email, presence: true

  has_many :products
  has_many :user_orders
  has_many :orders, through: :user_orders
  has_many :reviews, through: :products
  has_many :product_orders, through: :products
  has_many :product_categories, through: :products
end
