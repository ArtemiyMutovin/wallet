FactoryBot.define do
  factory :credit do
    debts { 1000 }
    active { true }


    trait :invalid do
      debts { nil }
      active { nil }
      user_id { nil }
      account_id { nil }
    end
  end
end
