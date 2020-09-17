require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  describe '注文関連の保存' do
    before do
      @purchase_order = FactoryBot.build(:purchase_order)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_order).to be_valid
    end
    it 'postal_codeが空だと保存できないこと' do
      @purchase_order.postal_code = nil
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid')
    end
    it 'postal_codeにハイフンがないと保存できないこと' do
      @purchase_order.postal_code = 0o001234
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include('Postal code is invalid')
    end
    it 'area_idが空だと保存できないこと' do
      @purchase_order.area_id = nil
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Area can't be blank")
    end
    it 'municipalityが空だと保存できないこと' do
      @purchase_order.municipality = nil
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'street_numberが空だと保存できないこと' do
      @purchase_order.street_number = nil
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Street number can't be blank")
    end
    it 'phoneが空だと保存できないこと' do
      @purchase_order.phone = nil
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Phone can't be blank")
    end
    it 'phoneが半角数字11桁以内でないと保存できないこと' do
      @purchase_order.phone = 4_524_254_535_452_525_553_254
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include('Phone is too long (maximum is 11 characters)')
    end
    it 'item_idが空だと保存できないこと' do
      @purchase_order.item_id = nil
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Item can't be blank")
    end
    it 'user_idが空だと保存できないこと' do
      @purchase_order.user_id = nil
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("User can't be blank")
    end
  end
end
