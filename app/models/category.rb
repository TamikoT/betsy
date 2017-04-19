class Category < ApplicationRecord
  validates :id, presence: true
  validates :name, presence: true

  belongs_to :product_category
  has_many :products, through: :product_category
end
