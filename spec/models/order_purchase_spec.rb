require 'rails_helper'

RSpec.describe OrderPurchase, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_purchase = FactoryBot.build(:order_purchase, user_id: @user.id, item_id: @item.id)
    end

    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_purchase).to be_valid
      end
      it '建物名が空でも保存できる' do
        expect(@order_purchase).to be_valid
        @order_purchase.building = ''
      end
    end
    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できないこと' do
        @order_purchase.postal_code = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は(３桁-４桁)の半角英数字でないと保存できないこと' do
        @order_purchase.postal_code = '1222-３11'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it '都道府県が---だと保存できないこと' do
        @order_purchase.prefectures_genre_id = 1
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Prefectures genre can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @order_purchase.municipalities = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @order_purchase.address = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @order_purchase.phone_number = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid')
      end
      it '電話番号にハイフンが入ると保存できないこと' do
        @order_purchase.phone_number = '090-0000000'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が9桁以下だと保存できないこと' do
        @order_purchase.phone_number = '01234567'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上だと保存できないこと' do
        @order_purchase.phone_number = '01234567890123'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が半角数値でないと保存できないこと' do
        @order_purchase.phone_number = '０９０00000000'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空だと保存できないこと' do
        @order_purchase.token = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'user.idが紐づいていないと保存できないこと' do
        @order_purchase.user_id = nil
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("User can't be blank")
      end
      it 'item.idが紐づいていないと保存できないこと' do
        @order_purchase.item_id = nil
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
