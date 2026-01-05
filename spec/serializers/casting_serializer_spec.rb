require 'rails_helper'

RSpec.describe CastingSerializer do
  let(:person) { create(:person, name: "Actor Name") }
  let(:movie) { create(:movie, title: "Movie Title") }
  let(:casting) { create(:casting, role_name: "Lead", movie: movie, person: person) }

  it "serializes the casting with associations" do
    result = described_class.render_as_hash(casting)
    expect(result).to include(
      id: casting.id,
      role_name: "Lead",
      created_at: casting.created_at,
      updated_at: casting.updated_at,
      movie: hash_including(id: movie.id, title: "Movie Title"),
      person: hash_including(id: person.id, name: "Actor Name")
    )
  end
end
