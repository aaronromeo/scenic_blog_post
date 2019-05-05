FactoryBot.define do
  factory :notification_preference do
    notification_type { NotificationPreference::SIGNUP }
    notification_frequency { NotificationPreference::IMMEDIATELY }
    association :user, factory: :user

    factory :organization_notification_preference do
      association :settable, factory: :organization
    end

    factory :event_notification_preference do
      association :settable, factory: :event
    end
  end
end
