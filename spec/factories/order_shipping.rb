FactoryBot.define do
  factory :order_shipping do
    postal_code { '111-2222' }
    prefecture_id { 2 }
    city { '大阪市' }
    house_number { '青山1-1' }
    call_number { '09011112222' }
  end
end
