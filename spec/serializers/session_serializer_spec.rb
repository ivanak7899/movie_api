require 'rails_helper'

RSpec.describe SessionSerializer do
  let(:user) { create(:user) }
  let(:session) { create(:session, user: user, token: "abc123") }

  it "serializes the session with token and user" do
    result = described_class.render_as_hash(session)
    expect(result).to include(
      id: session.id,
      token: "abc123",
      user: hash_including(id: user.id)
    )
  end
end
