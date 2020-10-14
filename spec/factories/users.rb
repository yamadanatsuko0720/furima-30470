FactoryBot.define do
  factory :user do
    nickname {"furima太郎"}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    last_name {"陸太郎"}
    first_name {"山田"}
    last_name_kana {"リクタロウ"}
    first_name_kana {"ヤマダ"}
    birth_date {"1990-01-01"}

  end
end