FactoryBot.define do
  factory :purchase_order do
    postal_code { '444-0004' }
    area_id { 5 }
    municipality { '板橋' }
    street_number { '34-432' }
    building_name { '北海道にあるビル' }
    phone { '77777777777' }
    token { 'gr34tsthsyst6u' }
    item_id { 4 }
    user_id { 4 }
  end
end
