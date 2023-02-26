class OrderPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_genre_id, :municipalities, :address, :building, :phone_number, :user_id, :item_id
  validates :prefectures_genre_id, numericality: {other_than: 1, message: "can't be blank"}
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :municipalities
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/, message: "is too short"}
  end
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Purchase.create(postal_code: postal_code, prefectures_genre_id: prefectures_genre_id, municipalities: municipalities, address: address, building: building, phone_number: phone_number)
  end
end