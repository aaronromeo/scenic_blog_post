class Event < ApplicationRecord
  belongs_to :organization
  has_many :notification_preferences, as: :settable, dependent: :destroy

  validates :name, presence: true
end
