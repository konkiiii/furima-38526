class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_genre
  belongs_to :condition_genre
  belongs_to :delivery_charge_genre
  belongs_to :prefectures_genre
  belongs_to :days_to_ship_genre

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_genre_id
    validates :condition_genre_id
    validates :delivery_charge_genre_id
    validates :prefectures_genre_id
    validates :days_to_ship_genre_id
  end

  belongs_to :user
  has_one :order

  with_options presence: true do
    validates :product_name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range',
                              only_integer: true }
    validates :image
  end
end
