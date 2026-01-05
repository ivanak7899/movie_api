require 'rails_helper'

RSpec.describe UserPolicy do
  let(:admin) { create(:user, :admin) }
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  describe "#index?" do
    it "permits any user" do
      expect(described_class.new(user, User).index?).to be true
      expect(described_class.new(admin, User).index?).to be true
    end
  end

  describe "#show?" do
    it "permits admin for any user" do
      expect(described_class.new(admin, user).show?).to be true
      expect(described_class.new(admin, other_user).show?).to be true
    end

    it "permits user for themselves" do
      expect(described_class.new(user, user).show?).to be true
    end

    it "denies user for other users" do
      expect(described_class.new(user, other_user).show?).to be false
    end
  end

  describe "#update?" do
    it "permits admin for any user" do
      expect(described_class.new(admin, user).update?).to be true
      expect(described_class.new(admin, other_user).update?).to be true
    end

    it "permits user for themselves" do
      expect(described_class.new(user, user).update?).to be true
    end

    it "denies user for other users" do
      expect(described_class.new(user, other_user).update?).to be false
    end
  end

  describe "#destroy?" do
    it "permits admin for any user" do
      expect(described_class.new(admin, user).destroy?).to be true
      expect(described_class.new(admin, other_user).destroy?).to be true
    end

    it "permits user for themselves" do
      expect(described_class.new(user, user).destroy?).to be true
    end

    it "denies user for other users" do
      expect(described_class.new(user, other_user).destroy?).to be false
    end
  end

  describe "Scope" do
    let!(:user1) { create(:user) }
    let!(:user2) { create(:user) }

    it "returns all users for admin" do
      scope = described_class::Scope.new(admin, User.all).resolve
      expect(scope).to include(user1, user2)
    end

    it "returns only self for regular user" do
      scope = described_class::Scope.new(user1, User.all).resolve
      expect(scope).to contain_exactly(user1)
    end
  end
end
