class ProductCategory < ApplicationRecord
  belongs_to :categories
  belongs_to :products
end
