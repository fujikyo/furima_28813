require 'rails_helper'
RSpec.describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('staff1.jpg')
  end
  
  describe '商品出品機能' do
    context '商品情報が保存できる' do
      it '全ての情報が入っていれば保存できる' do
      expect(@item).to be_valid
      end
    end

    context '商品情報が保存できない' do
      it 'imageが空欄で登録不可' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空欄で登録不可' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explanationが空欄で登録不可' do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが空欄登録不可' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end
      it 'status_idが空欄で登録不可' do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", "Status is not a number")
      end
      it 'charge_idが空欄で登録不可' do
        @item.charge_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank", "Charge is not a number")
      end
      it 'area_idが空欄で登録不可' do
        @item.area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank", "Area is not a number")
      end
      it 'day_idが空欄で登録不可' do
        @item.day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank", "Day is not a number")
      end
      it 'priceが空欄で登録不可' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300~9999999の範囲でないと登録不可' do
        @item.price = "23"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it 'priceが半角数字でないと登録不可' do
        @item.price = "５５５"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end
