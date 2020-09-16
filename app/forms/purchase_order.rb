class PurchaseOrder

  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipality, :street_number, :building_name, :phone, :item_id, :user_id, :token, :price, :purchase_id, :token
  # orderのバリデーション
  validates :token, presence: true
  validates :postal_code, :area_id, :municipality, :street_number, :phone, presence: true
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :phone, format: { with: /\A\d{11}\z/ }
  # purchasesのバリデーション
  validates :item_id, :user_id, presence: true

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Order.create(postal_code: postal_code, area_id: area_id, municipality: municipality, street_number: street_number, building_name: building_name, phone: phone, purchase_id: purchase.id)
  end
end