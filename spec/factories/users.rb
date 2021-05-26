FactoryBot.define do
  factory :user do
    nickname { 'you' }
    email { 'test@example' }
    password { 'test1234' }
    password_confirmation { password }
    family_name { '山田' }
    first_name { '太郎' }
    family_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birthday { '1999/01/01' }
  end
end
