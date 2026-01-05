require 'rails_helper'

RSpec.describe PersonPolicy do
  let(:admin) { create(:user, :admin) }
  let(:moderator) { create(:user, :moderator) }
  let(:user) { create(:user) }
  let(:person) { create(:person) }

  describe "#create?" do
    it "permits admin" do
      expect(described_class.new(admin, person).create?).to be true
    end

    it "permits moderator" do
      expect(described_class.new(moderator, person).create?).to be true
    end

    it "denies regular user" do
      expect(described_class.new(user, person).create?).to be false
    end
  end

  describe "#update?" do
    it "permits admin" do
      expect(described_class.new(admin, person).update?).to be true
    end

    it "permits moderator" do
      expect(described_class.new(moderator, person).update?).to be true
    end

    it "denies regular user" do
      expect(described_class.new(user, person).update?).to be false
    end
  end

  describe "#destroy?" do
    it "permits admin" do
      expect(described_class.new(admin, person).destroy?).to be true
    end

    it "permits moderator" do
      expect(described_class.new(moderator, person).destroy?).to be true
    end

    it "denies regular user" do
      expect(described_class.new(user, person).destroy?).to be false
    end
  end
end
