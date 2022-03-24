class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  validates :count, presence: true
  validates :price, presence: true

  enum making_status:{before: 0, wait: 1, make: 2, finish: 3}
end
