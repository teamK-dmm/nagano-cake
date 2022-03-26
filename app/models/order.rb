class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items

  validates :receiver_name, presence: true
  validates :address, presence: true

  validates :postal_code, presence: true, format:{ with:  /\A\d{7}\z/}
  validates :billing_amount, presence: true

  enum payment_method: {credit_card: 0, transfer: 1}
  enum status: { 入金待ち: 0, 入金確認: 1, 制作中: 2, 発送準備中: 3, 発送中: 4 }


  def total_amount
    amount = 0
    order_items = self.order_items
    order_items.each do |item|
      amount = amount+item.count
    end
    amount
  end
end
