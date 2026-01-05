require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  it { should have_secure_password }
  it { should have_many(:reviews).dependent(:destroy) }
  it { should have_many(:sessions).dependent(:destroy) }
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should allow_value("user@example.com").for(:email) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should validate_presence_of(:role) }
  it { should validate_inclusion_of(:role).in_array(User::ROLES) }

  describe "#admin?" do
    it "returns true if role is admin" do
      expect(build(:user, role: "admin").admin?).to be true
    end
    it "returns false if role is not admin" do
      expect(build(:user, role: "user").admin?).to be false
    end
  end

  describe "#moderator?" do
    it "returns true if role is moderator" do
      expect(build(:user, role: "moderator").moderator?).to be true
    end
    it "returns false if role is not moderator" do
      expect(build(:user, role: "user").moderator?).to be false
    end
  end

  describe "#user?" do
    it "returns true if role is user" do
      expect(build(:user, role: "user").user?).to be true
    end
    it "returns false otherwise" do
      expect(build(:user, role: "admin").user?).to be false
    end
  end
end
