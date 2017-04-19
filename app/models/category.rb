class Category < ApplicationRecord
  validates :id, presence: true
  validates :name, presence: true

  belongs_to :product_category
end
