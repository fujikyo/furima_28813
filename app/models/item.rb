class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :charge
  belongs_to_active_hash :area
  belongs_to_active_hash :day
  
  validates :name, :explanation, :price, :category, :status, :charge, :area, :day, :user, presence: true
  validates :category_id, :status_id, :charge_id, :area_id, :day_id, numericality: { other_than: 1 } 
  validates :price, inclusion: {in: 300..9999999 }
  
  belongs_to :user
  has_one :purchase
  # active strage
  has_one_attached :image
end
