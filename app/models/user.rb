class User < ApplicationRecord
  has_many :notification_preferences, dependent: :destroy
  has_many :memberships
  has_many :organizations, through: :memberships
  has_many :participations
  has_many :events, through: :participations

  validates :username, presence: true
end
