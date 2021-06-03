require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  describe '配送先' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題がない場合' do
      it 'すべての情報があれば登録できる' do
        expect(@order_shipping).to be_valid
      end

      it 'building_nameが空でも登録できる' do
        @order_shipping.building_name = ''
        expect(@order_shipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空では登録できないこと' do
        @order_shipping.token = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空では登録できないこと' do
        @order_shipping.postal_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにーがないと登録できないこと' do
        @order_shipping.postal_code = 111-2222
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code is invalid")
      end

      it 'prefrecture_idが0では登録できないこと' do
        @order_shipping.prefecture_id = 0
      
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Prefecture must be other than 0")
      end

      it 'cityが空では登録できないこと' do
        @order_shipping.city = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空では登録できないこと' do
        @order_shipping.house_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("House number can't be blank")
      end

      it 'call_numberが空では登録できないこと' do
        @order_shipping.call_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Call number can't be blank")
      end

      it 'call_numberが12桁以上では登録できないこと' do
        @order_shipping.call_number = '090111122223'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Call number is invalid")
      end

      it 'call_numberが9桁以下なら登録できないこと' do
        @order_shipping.call_number = '090111222'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Call number is invalid")
      end
    end
  end
end