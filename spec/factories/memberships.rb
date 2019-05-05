FactoryBot.define do
  factory :membership do
    association :user, factory: :user
    association :organization, factory: :organization
  end
end
