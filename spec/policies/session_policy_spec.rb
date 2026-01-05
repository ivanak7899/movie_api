require 'rails_helper'

RSpec.describe SessionPolicy do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:session) { create(:session, user: user) }
  let(:other_session) { create(:session, user: other_user) }

  describe "#show?" do
    it "permits owner" do
      expect(described_class.new(user, session).show?).to be true
    end

    it "denies non-owner" do
      expect(described_class.new(user, other_session).show?).to be false
    end
  end

  describe "#destroy?" do
    it "permits owner" do
      expect(described_class.new(user, session).destroy?).to be true
    end

    it "denies non-owner" do
      expect(described_class.new(user, other_session).destroy?).to be false
    end
  end

  describe "Scope" do
    it "returns only sessions belonging to user" do
      session
      other_session
      scope = described_class::Scope.new(user, Session.all).resolve
      expect(scope).to contain_exactly(session)
    end
  end
end
