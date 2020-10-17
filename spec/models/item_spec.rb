require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

  describe '商品出品' do
    context '出品がうまくいくとき' do
      it "全ての項目が存在すれば出品できる" do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it "画像がないと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名がないと出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "カテゴリーの情報がないと出品できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end
      it "カテゴリーの情報が1を選んだときは出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品の状態についての情報がないと出品できない" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", "Status is not a number")
      end
      it "商品の状態についての情報が1を選んだときは出品できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "配送料の負担の情報がないと出品できない" do
        @item.postage_payer_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer can't be blank", "Postage payer is not a number")
      end
      it "配送料の負担の情報が1を選んだときは出品できない" do
        @item.postage_payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer must be other than 1")
      end
      it "発送元の地域についての情報がないと出品できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
      end
      it "発送元の地域についての情報が1を選んだときは出品できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "発送までの日数についての情報がないと出品できない" do
        @item.preparation_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparation day can't be blank", "Preparation day is not a number")
      end
      it "発送までの日数についての情報が1を選んだときは出品できない" do
        @item.preparation_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparation day must be other than 1")
      end
      it "価格についての情報がないと出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格の範囲が、¥300~¥9,999,999の間でないと出品できない(300円以下の時)" do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "価格の範囲が、¥300~¥9,999,999の間でないと出品できない(1000万円以上の時)" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "販売価格が半角数字でないと出品できない" do
        @item.price = "１００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
  end
end