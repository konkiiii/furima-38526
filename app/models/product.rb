class Product < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_genre_id
  belongs_to :condition_genre_id
  belongs_to :delivery_charge_genre_id
  belongs_to :prefectures_genre_id
  belongs_to :days_to_ship_genre_id

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_genre_id
    validates :condition_genre_id
    validates :delivery_charge_genre_id
    validates :prefectures_genre_id
    validates :days_to_ship_genre_id
  end
  # この書き方でダメな場合は修正(1つずつ記述に変更)
end
