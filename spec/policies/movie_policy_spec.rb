require 'rails_helper'

RSpec.describe MoviePolicy do
  let(:admin) { create(:user, :admin) }
  let(:moderator) { create(:user, :moderator) }
  let(:user) { create(:user) }
  let(:movie) { create(:movie) }

  describe "#create?" do
    it "permits admin" do
      expect(described_class.new(admin, movie).create?).to be true
    end

    it "permits moderator" do
      expect(described_class.new(moderator, movie).create?).to be true
    end

    it "denies regular user" do
      expect(described_class.new(user, movie).create?).to be false
    end
  end

  describe "#update?" do
    it "permits admin" do
      expect(described_class.new(admin, movie).update?).to be true
    end

    it "permits moderator" do
      expect(described_class.new(moderator, movie).update?).to be true
    end

    it "denies regular user" do
      expect(described_class.new(user, movie).update?).to be false
    end
  end

  describe "#destroy?" do
    it "permits admin" do
      expect(described_class.new(admin, movie).destroy?).to be true
    end

    it "permits moderator" do
      expect(described_class.new(moderator, movie).destroy?).to be true
    end

    it "denies regular user" do
      expect(described_class.new(user, movie).destroy?).to be false
    end
  end
end
