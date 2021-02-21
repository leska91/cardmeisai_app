require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
    sleep 0.1
  end

  describe 'カード明細登録機能' do
    context '登録できるとき' do
      it '必要な情報を適切に入力すると、情報の登録ができる' do
        expect(@order).to be_valid
      end
      it 'memoが空でも登録できる' do
        @order.memo = ''
        expect(@order).to be_valid
      end
    end

    context '登録できないとき' do
      it 'カード利用日が空だと登録できない' do
        @order.date = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Date can't be blank")
      end
      it '利用額が空だと登録できない' do
        @order.amount = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Amount can't be blank")
      end
      it 'カテゴリーが空だと登録ができない' do
        @order.category_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Category is not a number")
      end
      it 'カテゴリーidが１だと登録ができない' do
        @order.category_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Category must be other than 1")
      end
      it '利用額の値が空だと登録ができない' do
        @order.amount = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Amount can't be blank")
      end
      it '利用額の値が¥0であれば登録できない' do
        @order.amount = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Amount out of setting range")
      end
      it '利用額の値が￥10,000,000以上の場合は登録できない' do
        @order.amount = 10_000_000
        @order.valid?
        expect(@order.errors.full_messages).to include("Amount out of setting range")
      end
      it '利用額の値が半角数字でない場合は登録ができない_全角数字の場合' do
        @order.amount = '３０００'
        @order.valid?
        expect(@order.errors.full_messages).to include("Amount out of setting range")
      end
      it '利用額が英数混合入力されても登録できない' do
        @order.amount = 'a5a5a5'
        @order.valid?
        expect(@order.errors.full_messages).to include("Amount out of setting range")
      end
      it '利用額が半角英語では登録できない' do
        @order.amount = 'ababab'
        @order.valid?
        expect(@order.errors.full_messages).to include("Amount out of setting range")
      end
    end
  end
end
