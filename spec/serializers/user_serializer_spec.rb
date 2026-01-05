require 'rails_helper'

RSpec.describe UserSerializer do
  let(:user) { create(:user, username: "testuser", email: "test@example.com", role: "admin") }

  it "serializes the user with expected fields" do
    result = described_class.render_as_hash(user)
    expect(result).to include(
      id: user.id,
      username: "testuser",
      email: "test@example.com",
      role: "admin",
      created_at: user.created_at,
      updated_at: user.updated_at
    )
  end
end
