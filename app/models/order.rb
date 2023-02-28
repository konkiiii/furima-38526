class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :purchase
  # 必要であればformオブジェクトのモデルに移す
end
