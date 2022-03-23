class Genre < ApplicationRecord
  has_many :items

    #enumの記述方式
# 	enum valid_invalid_status: { 有効: 0, 無効: 1}

    #バリデーションname空欄禁止
	validates :name, presence: true

end
