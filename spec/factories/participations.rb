FactoryBot.define do
  factory :participation do
    association :user, factory: :user
    association :event, factory: :event
  end
end
