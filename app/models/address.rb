class Address < ApplicationRecord
  belongs_to :customer
<<<<<<< HEAD
  def full_address
    '〒' + postal_code + ' ' + address + ' ' + receiver_name
=======

  #郵便　住所　名前を一括で表示する
  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
>>>>>>> 7eb7e86f4277526b1483bead9e93b328ac9d57ed
  end
end
