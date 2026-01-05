# spec/policies/casting_policy_spec.rb
require 'rails_helper'

RSpec.describe CastingPolicy do
  let(:admin) { create(:user, :admin) }
  let(:moderator) { create(:user, :moderator) }
  let(:user) { create(:user) }
  let(:casting) { create(:casting) }

  describe "#create?" do
    it "permits admin" do
      policy = described_class.new(admin, casting)
      expect(policy.create?).to be true
    end

    it "permits moderator" do
      policy = described_class.new(moderator, casting)
      expect(policy.create?).to be true
    end

    it "denies regular user" do
      policy = described_class.new(user, casting)
      expect(policy.create?).to be false
    end
  end

  describe "#update?" do
    it "permits admin" do
      policy = described_class.new(admin, casting)
      expect(policy.update?).to be true
    end

    it "permits moderator" do
      policy = described_class.new(moderator, casting)
      expect(policy.update?).to be true
    end

    it "denies regular user" do
      policy = described_class.new(user, casting)
      expect(policy.update?).to be false
    end
  end

  describe "#destroy?" do
    it "permits admin" do
      policy = described_class.new(admin, casting)
      expect(policy.destroy?).to be true
    end

    it "permits moderator" do
      policy = described_class.new(moderator, casting)
      expect(policy.destroy?).to be true
    end

    it "denies regular user" do
      policy = described_class.new(user, casting)
      expect(policy.destroy?).to be false
    end
  end
end
