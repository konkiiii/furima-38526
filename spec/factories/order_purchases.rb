FactoryBot.define do
  factory :order_purchase do
    postal_code { '123-1234' }
    prefectures_genre_id { '2' }
    municipalities { '横浜市緑区' }
    address { '3-4' }
    building { '青山ビル' }
    phone_number { '09012341234' }
    token { 'tok_abcdefghijk00000000000000000' }

    association :user_id
    association :item_id
  end
end
