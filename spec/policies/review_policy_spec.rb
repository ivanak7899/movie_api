require 'rails_helper'

RSpec.describe ReviewPolicy do
  let(:user) { create(:user) }
  let(:admin) { create(:user, :admin) }
  let(:moderator) { create(:user, :moderator) }
  let(:other_user) { create(:user) }
  let(:review) { create(:review, user: user) }
  let(:other_review) { create(:review, user: other_user) }

  describe "#update?" do
    it "permits owner" do
      expect(described_class.new(user, review).update?).to be true
    end

    it "denies non-owner" do
      expect(described_class.new(user, other_review).update?).to be false
    end
  end

  describe "#destroy?" do
    it "permits admin" do
      expect(described_class.new(admin, review).destroy?).to be true
    end

    it "permits moderator" do
      expect(described_class.new(moderator, review).destroy?).to be true
    end

    it "permits owner" do
      expect(described_class.new(user, review).destroy?).to be true
    end

    it "denies non-owner, non-admin, non-moderator" do
      expect(described_class.new(other_user, review).destroy?).to be false
    end
  end
end
