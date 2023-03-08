require 'rails_helper'

RSpec.describe BuyerRecord, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @record_buyer = FactoryBot.build(:buyer_record, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入情報の保存' do
    context '商品購入情報を保存できるとき' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@record_buyer).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @record_buyer.building_name = ''
        expect(@record_buyer).to be_valid
      end
    end

    context '商品購入情報を保存できないとき' do
      it 'tokenが空では保存できない' do
        @record_buyer.token = ' '
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空では保存できない' do
        @record_buyer.post_code = ''
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include("Post code can't be blank")
      end
      it 'area_idが空では保存できない' do
        @record_buyer.area_id = ''
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include("Area can't be blank")
      end
      it 'cityが空では保存できない' do
        @record_buyer.city = ''
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では保存できない' do
        @record_buyer.address = ''
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @record_buyer.phone_number = ''
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'post_codeはハイフンがないと保存できない' do
        @record_buyer.post_code = '1234567'
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include('Post code is invalid')
      end
      it 'post_codeは半角英数混合では保存できない' do
        @record_buyer.post_code = '123-abcd'
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include('Post code is invalid')
      end
      it 'post_codeは全角では保存できない' do
        @record_buyer.post_code = '１２３-４５６７'
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include('Post code is invalid')
      end
      it 'area_idは選択していないと保存できない' do
        @record_buyer.area_id = 1
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include('Area must be other than 1')
      end
      it 'phone_numberは12桁の数字では保存できない' do
        @record_buyer.phone_number = '090123456789'
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは半角英数混合では保存できない' do
        @record_buyer.phone_number = 'abc123456789'
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは全角では保存できない' do
        @record_buyer.phone_number = '０９０１２３４５６７８'
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include('Phone number is invalid')
      end
      it 'user_id（購入者）が空だと保存できない' do
        @record_buyer.user_id = ' '
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include("User can't be blank")
      end
      it 'item_id（購入商品）が空だと保存できない' do
        @record_buyer.item_id = ' '
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end