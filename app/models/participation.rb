class Participation < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :user, presence: true
  validates :event, presence: true
  validates :user, uniqueness: { scope: :event_id }
end
