FactoryBot.define do
  factory :event do
    association :organization, factory: :organization
    name { |n| Faker::Marketing.buzzwords }
  end
end
