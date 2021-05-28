require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品ページ' do
    before do
      @item = FactoryBot.build(:item)
    end
    
    context '内容に問題がない場合' do
      it 'すべての情報があれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'imageが空では登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'product_nameが空では登録できないこと' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it 'descriptionが空では登録できないこと' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'priceが空では登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300円以下だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end

      it 'priceが9,999,999以上だと出品できない' do
        @item.price = 9_999_999
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end

      it 'priceが半角でないと登録できないこと' do
        @item.price = '３３３３'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'priceが半角英数混合では登録できないこと' do
        @item.price = '300aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'priceが半角英数だけでは登録できないこと' do
        @item.price = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'category_idが0では登録できないこと' do
        @item.category_id =  0 
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end

      it 'status_idが0では登録できないこと' do
        @item.status_id =  0 
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 0")
      end

      it 'burden_idが0では登録できないこと' do
        @item.burden_id =  0 
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden must be other than 0")
      end

      it 'prefecture_idが0では登録できないこと' do
        @item.prefecture_id =  0 
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end

      it 'delivery_date_idが0では登録できないこと' do
        @item.delivery_date_id =  0 
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date must be other than 0")
      end
    end
  end
end
