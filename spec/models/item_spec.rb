require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品情報入力' do
    context '商品情報入力がうまくいく時' do
      it '全ての値が正しく入力されていれば出品できること' do
        expect(@item).to be_valid
      end
    end
    context '商品情報の入力がうまくいかない時' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'product_nameが空だと出品できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it 'conceptが空だと出品できない' do
        @item.concept = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Concept can't be blank")
      end
      it 'categoryが未選択だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'item_conditionが未選択だと出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'charge_priceが未選択だと出品できない' do
        @item.charge_price_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge price can't be blank")
      end
      it 'prefectureが未選択だと出品できない' do
        @item.deadline_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Deadline can't be blank")
      end
      it 'areaが未選択だと出品できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it 'product_priceが空だと出品できない' do
        @item.product_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product price can't be blank")
      end
      it 'product_priceが全角数字だと出品できない' do
        @item.product_price = "２０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Product price is not a number")
      end
      it 'product_priceが300円以上ないと出品できない' do
        @item.product_price = "200"
        @item.valid?
        expect(@item.errors.full_messages).to include("Product price must be greater than or equal to 300")
      end
      it 'product_priceが9,999,999を超えると出品できない' do
        @item.product_price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Product price must be less than or equal to 9999999")
      end
    end
  end
end