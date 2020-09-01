FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials}
    email {Faker::Internet.free_email}
    password {"qwer1234"}
    password_confirmation {password} 
    firstname_hira {"山田"}
    lastname_hira {"太郎"}
    firstname_kana {"ヤマダ"}
    lastname_kana {"タロウ"}
    birthday {"1992-04-02"}
  end
end
