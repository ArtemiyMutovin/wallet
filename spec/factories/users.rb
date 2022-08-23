FactoryBot.define do
  sequence :email do |n|
    "user#{n}@mail"
  end

  factory :user do
    email
    first_name { 'First' }
    last_name { 'Last' }
    password { '123456' }
    password_confirmation { '123456' }
    confirmed_at { Time.zone.now }
  end
end
