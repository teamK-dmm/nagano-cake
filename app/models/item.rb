class Item < ApplicationRecord
  belongs_to :genre
  has_many :oder_items
  has_many :cart_items
end
