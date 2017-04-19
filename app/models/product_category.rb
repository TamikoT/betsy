class ProductCategory < ApplicationRecord
  validates :catogory_id, presence: true
  validates :product_id, presence: true

  has_many :categories
  has_many :products
end
