class Organization < ApplicationRecord
  has_many :events
  has_many :memberships
  has_many :users, through: :memberships
  has_many :notification_preferences, as: :settable, dependent: :destroy

  validates :name, presence: true
end
