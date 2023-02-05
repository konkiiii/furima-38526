require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '商品出品できる時' do
      it 'itemsテーブルのカラムが全て存在する時' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない時' do
      it '商品画像が空だと商品が出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと商品が出品できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it '商品説明が空だと商品が出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが---だと商品が出品できない' do
        @item.category_genre_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category genre can't be blank")
      end
      it '商品の状態が---だと商品が出品できない' do
        @item.condition_genre_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition genre can't be blank")
      end
      it '配送料の負担が---だと商品が出品できない' do
        @item.delivery_charge_genre_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge genre can't be blank")
      end
      it '発送元の地域が---だと商品が出品できない' do
        @item.prefectures_genre_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures genre can't be blank")
      end
      it '発送までの日数---だと商品が出品できない' do
        @item.days_to_ship_genre_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship genre can't be blank")
      end
      it '価格が空だと商品が出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格に全角数字が存在すると入力できない' do
        @item.price = '12３４'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it '価格が300円未満だと商品が出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it '価格が10M円以上だと商品が出品できない' do
        # binding.pry
        @item.price = 1999999999
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
    end
  end
end
