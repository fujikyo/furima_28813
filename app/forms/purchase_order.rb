class PurchaseOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipality, :street_number, :building_name, :phone, :item_id, :user_id, :token, :price, :purchase_id, :token
  with_options presence: true do
    validates :token
    validates :postal_code
    validates :area_id
    validates :municipality
    validates :street_number
    validates :phone
    validates :item_id
    validates :user_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone, numericality: { only_integer: true }
    validates :phone, length: { maximum: 11 }
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Order.create(postal_code: postal_code, area_id: area_id, municipality: municipality, street_number: street_number, building_name: building_name, phone: phone, purchase_id: purchase.id)
  end
end
