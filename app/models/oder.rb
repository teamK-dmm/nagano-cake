class Oder < ApplicationRecord
  belongs_to :customer
  has_many :order_items

  #enum定義「0=>クレジットカード、1=>銀行振込」
  enum payment_method: { credit_card: 0, transfer: 1 }
end
