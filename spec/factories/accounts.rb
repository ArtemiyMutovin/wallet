FactoryBot.define do
  sequence :number do |n|
    n
  end

  factory :account do
    number
    balance { 100 }
  end
end
