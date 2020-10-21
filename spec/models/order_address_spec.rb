require 'rails_helper'
RSpec.describe OrderAddress, type: :model do
  describe '#create' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

  describe '商品購入' do

    context '購入がうまくいくとき' do
      it "tokenと送付先の必須項目が存在すれば購入できる" do
        expect(@order_address).to be_valid
      end
      it "建物名がなくても購入できる" do
        @order_address.building_name = ""
        expect(@order_address).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it "tokenがないと購入できない" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号がないと購入できない" do
        @order_address.post_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it "郵便番号にハイフンがないと購入できない" do
        @order_address.post_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it "都道府県が選択されていないと購入できない" do
        @order_address.prefecture_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture is not a number")
      end
      it "都道府県で1を選んだときは出品できない" do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "市区町村がないと購入できない" do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it "番地がないと購入できない" do
        @order_address.house_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it "電話番号がないと購入できない" do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号11桁以内でないと購入できない" do
        @order_address.phone_number = "090123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input half-width characters.")
      end
    end
  end
  end
end
