require 'rails_helper'

RSpec.describe MovieSerializer do
  let(:director) { create(:person, name: "Director Name") }
  let(:actor1) { create(:person, name: "Actor One") }
  let(:actor2) { create(:person, name: "Actor Two") }
  let(:movie) { create(:movie, title: "Movie Title", description: "Desc", release_year: 2020, director: director, actors: [ actor1, actor2 ]) }

  it "serializes the movie with director and actors" do
    result = described_class.render_as_hash(movie)
    expect(result).to include(
      id: movie.id,
      title: "Movie Title",
      description: "Desc",
      release_year: 2020,
      created_at: movie.created_at,
      updated_at: movie.updated_at,
      director: hash_including(id: director.id, name: "Director Name"),
      actors: array_including(
        hash_including(id: actor1.id, name: "Actor One"),
        hash_including(id: actor2.id, name: "Actor Two")
      )
    )
  end
end
