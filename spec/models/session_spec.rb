require 'rails_helper'

RSpec.describe Session, type: :model do
  it { should belong_to(:user) }
  it { should have_secure_token(:token) }

  describe ".active" do
    it "returns only sessions with nil revoked_at" do
      active = create(:session, revoked_at: nil)
      revoked = create(:session, revoked_at: Time.current)
      expect(Session.active).to include(active)
      expect(Session.active).not_to include(revoked)
    end
  end

  describe "#revoke!" do
    it "sets revoked_at to current time" do
      session = create(:session, revoked_at: nil)
      session.revoke!
      expect(session.revoked_at).not_to be_nil
    end
  end

  describe ".find_by_token!" do
    it "finds active session by token" do
      session = create(:session)
      expect(Session.find_by_token!(session.token)).to eq(session)
    end
    it "raises error if session is revoked" do
      session = create(:session, revoked_at: Time.current)
      expect { Session.find_by_token!(session.token) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
