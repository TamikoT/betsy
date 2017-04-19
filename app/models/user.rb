class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, format: { with: /\A[-\w.]*\z/, message: ‘: Only accepts letters, numbers, period, hyphens and underscore allowed’ }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i/, message: "Email format." }

  has_many :products
  has_many :user_orders
  has_many :orders, through: :user_orders
  has_many :reviews, through: :products
end
