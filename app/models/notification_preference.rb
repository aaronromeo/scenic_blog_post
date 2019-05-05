class NotificationPreference < ApplicationRecord
  NOTIFICATION_FREQUENCY = [
    DAILY = 'daily'.freeze,
    WEEKLY = 'weekly'.freeze,
    IMMEDIATELY = 'immediately'.freeze,
  ]

  NOTIFICATION_TYPE = [
    SIGNUP = 'signup'.freeze,
    EVENT_CANCELLATION = 'event_cancellation'.freeze,
    EVENT_CREATED = 'event_created'.freeze,
  ]

  belongs_to :user
  belongs_to :settable, polymorphic: true

  validates :notification_type, presence: true
  validates :notification_frequency, presence: true
  validates :settable, presence: true
end
