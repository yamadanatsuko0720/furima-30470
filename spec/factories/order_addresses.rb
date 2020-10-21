FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    post_code {"123-4567"}
    prefecture_id {"2"}
    city {"目黒区"}
    house_number {"1-1-1"}
    phone_number {"09012345678"}
    # association :item
  end
end
