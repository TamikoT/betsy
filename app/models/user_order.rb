class UserOrder < ApplicationRecord
  validates :user_id, presence: true
  validates :order_id, presence: true

  belongs_to :user
  belongs_to :order
end
