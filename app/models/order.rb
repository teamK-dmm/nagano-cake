class Order < ApplicationRecord

  has_many :order_items

  def total_amount
    amount = 0
    order_items = self.order_items
    order_items.each do |item|
      amount = amount+item.count
    end
    amount
  end

end
