class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :organization

  validates :user, presence: true
  validates :organization, presence: true
  validates :user, uniqueness: { scope: :organization_id }
end
