class Product < ApplicationRecord
  validates :status, presence: true
  validates :id, presence: true
  validates :stock, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :user_id, presence: true
  # NOTE: Did not add validations for photo.

  belongs_to :product_categories
  belongs_to :users

  has_many :product_orders
  has_many :reviews



end
