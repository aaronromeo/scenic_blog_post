require 'rails_helper'

RSpec.describe Organization, type: :model do
  let(:organization) { create(:organization) }
  let(:notification_preference) { create(:organization_notification_preference, settable: organization) }
  let(:event) { create(:event, organization: organization) }
  let(:membership) { create(:membership, organization: organization) }

  it "has a name" do
    expect(organization.name).to be_present
    organization.name = nil
    expect(organization.valid?).to be_falsey
  end

  it "has many notification preferences" do
    expect(notification_preference.settable).to eq(organization)
    expect(organization.notification_preferences.count).to eq(1)
    expect(organization.notification_preferences.first).to eq(notification_preference)
  end

  it "has many events" do
    expect(event.organization).to eq(organization)
    expect(organization.events.count).to eq(1)
    expect(organization.events.first).to eq(event)
  end

  it "has many users though memberships" do
    expect(membership.organization).to eq(organization)
    expect(organization.memberships.count).to eq(1)
    expect(organization.memberships.first).to eq(membership)
    expect(organization.users.first).to eq(membership.user)
  end
end
