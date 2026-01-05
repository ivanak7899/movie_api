require 'rails_helper'

RSpec.describe ReviewSerializer do
  let(:user) { create(:user) }
  let(:movie) { create(:movie) }
  let(:review) { create(:review, user: user, movie: movie, rating: 4, comment: "Great!", created_at: Time.current) }

  it "serializes the review with associations" do
    result = described_class.render_as_hash(review)
    expect(result).to include(
      id: review.id,
      rating: 4,
      comment: "Great!",
      created_at: review.created_at,
      updated_at: review.updated_at,
      user: hash_including(id: user.id),
      movie: hash_including(id: movie.id)
    )
  end
end
