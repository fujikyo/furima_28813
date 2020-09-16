class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  attr_accessor :token
  validates :price, :token, presence: true
  validates :postal_code, :prefecture_id, :municipality, :street_number, :phone, :purchase, presence: true
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :phone, format: { with: /\A\d{11}\z/ }
  belongs_to :purchase
  belongs_to :item
end
