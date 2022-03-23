class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  has_one_attached :image
  
  def subtotal
    item.with_tax_price * count
  end
  
end
