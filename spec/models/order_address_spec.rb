require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    item = FactoryBot.build(:item)
    user = FactoryBot.build(:user)
    @address = FactoryBot.build(:order_address, item_id:[item.id], user_id:[user.id])
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it '全てが正しく入力されていれば購入できる' do
        expect(@address).to be_valid
      end

      it 'buildingが空でも登録できる' do
        @address.building = ''
        expect(@address).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'post_codeが空では購入できない' do
        @address.post_code = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Post code can't be blank")
      end

      it 'prefectureが空では保存できない' do
        @address.prefecture_id = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefecture is not a number")
      end

      it 'prefectureが1では保存できない' do
        @address.prefecture_id = 1
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'cityが空では購入できない' do
        @address.city = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numが空では購入できない' do
        @address.house_num = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("House num can't be blank")
      end

      it 'phone_numが空では購入できない' do
        @address.phone_num = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone num can't be blank")
      end

      it "tokenが空では購入できない" do
        @address.token = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end



# bundle exec rspec spec/models/order_address_spec.rb