class Purchase < ApplicationRecord
  validates :item_id, :user_id, presence: true
  has_one :order
  belongs_to :user
  belongs_to :item
end
