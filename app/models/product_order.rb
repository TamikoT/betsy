class ProductOrder < ApplicationRecord
  validates :id, presence: true
  validates :product_id, presence: true
  validates :order_id, presence: true

  belongs_to :product
  belongs_to :order
end
