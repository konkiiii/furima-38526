class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_genre_id
  belongs_to :condition_genre_id
  belongs_to :delivery_charge_genre_id
  belongs_to :prefectures_genre_id
  belongs_to :days_to_ship_genre_id

  # with_options numericality: { other_than: 1, message: "can't be blank" } do
  #   validates :category_genre_id
  #   validates :condition_genre_id
  #   validates :delivery_charge_genre_id
  #   validates :prefectures_genre_id
  #   validates :days_to_ship_genre_id
  # end
  validates :category_genre_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :condition_genre_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :delivery_charge_genre_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :prefectures_genre_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :days_to_ship_genre_id, numericality: { other_than: 1, message: "can't be blank" } 

  belongs_to :user

  with_options presence:true do
    validates :user
    validates :product_name
    validates :description
    validates :price
  end
end
