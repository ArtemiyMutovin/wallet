FactoryBot.define do
  factory :transfer do
    amount { 100 }
    cipher { '1' }

    trait :invalid do
      amount { -1 }
      cipher { '1' }
    end
  end
end
