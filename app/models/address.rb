class Address < ApplicationRecord
  belongs_to :customer

  #郵便　住所　名前を一括で表示する
  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end
end
