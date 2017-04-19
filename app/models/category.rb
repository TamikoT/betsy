class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many: products, through: product_category
  has_many: product_categories
end
