FactoryBot.define do
  factory :item do
    name {"商品名"}
    explanation {"商品説明のテキスト"}
    category_id {3}
    status_id {4}
    charge_id {2}
    area_id {3}
    day_id {2}
    price {1234}
    association :user
  end
end
