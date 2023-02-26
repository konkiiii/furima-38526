class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :purchase
  # attr_accessor :token
  # validates :token, presence: true
  # 必要であればformオブジェクトのモデルに移す
end
