class Address < ApplicationRecord
belongs_to :customer
  def full_address
    '〒' + postal_code + ' ' + address + ' ' + receiver_name
  end
end
