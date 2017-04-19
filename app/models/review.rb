class Review < ApplicationRecord
  validates :id, presence: true
  validates :rating, presence: true
  # NOTE: Did not add validations for comment.

  belongs_to :product
end
