class ProductOrder < ApplicationRecord
  has_many :products
  has_many :orders

  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
end
