require 'rails_helper'

RSpec.describe PersonSerializer do
  let(:person) { create(:person, name: "Jane Doe") }

  it "serializes the person with name" do
    result = described_class.render_as_hash(person)
    expect(result).to include(
      id: person.id,
      name: "Jane Doe",
      created_at: person.created_at,
      updated_at: person.updated_at
    )
  end
end
