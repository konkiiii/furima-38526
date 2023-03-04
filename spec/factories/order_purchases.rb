FactoryBot.define do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
  end

  factory :order_purchase do
    postal_code { '123-1234' }
    prefectures_genre_id { '2' }
    municipalities { '横浜市緑区' }
    address { '3-4' }
    building { '青山ビル' }
    phone_number { '09012341234' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
