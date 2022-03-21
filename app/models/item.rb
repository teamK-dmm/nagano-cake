class Item < ApplicationRecord
  belongs_to :genre
  has_many :oder_items
  has_many :cart_items
  
  has_one_attached :image
  
end
