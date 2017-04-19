class ProductOrder < ApplicationRecord
  has_many :product
  has_many :order
end
