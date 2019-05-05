require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:organization) { create(:organization) }
  let(:event) { create(:event, organization: organization) }
  let(:organization_notification_preference) { create(:organization_notification_preference, user: user) }
  let(:event_notification_preference) { create(:event_notification_preference, user: user) }
  let(:membership) { create(:membership, user: user) }
  let(:participation) { create(:participation, user: user) }

  it "has a username" do
    expect(user.username).to be_present
    user.username = nil
    expect(user.valid?).to be_falsey
  end

  context "with organization_notification_preference" do
    it "has many notification preferences" do
      expect(organization_notification_preference.user).to eq(user)
      expect(user.notification_preferences.count).to eq(1)
      expect(user.notification_preferences.first).to eq(organization_notification_preference)
    end
  end

  context "with event_notification_preference" do
    it "has many notification preferences" do
      expect(event_notification_preference.user).to eq(user)
      expect(user.notification_preferences.count).to eq(1)
      expect(user.notification_preferences.first).to eq(event_notification_preference)
    end
  end

  it "has many organizations through memberships" do
    expect(membership.user).to eq(user)
    expect(user.memberships.count).to eq(1)
    expect(user.memberships.first).to eq(membership)
    expect(user.organizations.first).to eq(membership.organization)
  end

  it "has many events though participations" do
    expect(participation.user).to eq(user)
    expect(user.participations.count).to eq(1)
    expect(user.participations.first).to eq(participation)
    expect(user.events.first).to eq(participation.event)
  end
end
