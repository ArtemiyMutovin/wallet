FactoryBot.define do
  sequence :number do |n|
    n
  end

  factory :account do
    number
    balance { 1000 }

    trait :receiver_account do
      number
      balance { 500 }
    end
  end
end
