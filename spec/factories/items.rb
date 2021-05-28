FactoryBot.define do
  factory :item do
    product_name { 'オムライス' }
    description { 'テストコードのテスト' }
    category_id { '2' }
    status_id { '2' }
    burden_id { '2' }
    prefecture_id { '2' }
    delivery_date_id { '2' }
    price { 3000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
