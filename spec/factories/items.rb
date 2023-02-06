FactoryBot.define do
  factory :item do
    product_name { 'test' }
    description { 'test' }
    category_genre_id { '2' }
    condition_genre_id { '2' }
    delivery_charge_genre_id { '2' }
    prefectures_genre_id { '2' }
    days_to_ship_genre_id { '2' }
    price { '5000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
