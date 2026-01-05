require 'rails_helper'

RSpec.describe "Reviews API", type: :request do
  let(:user) { create(:user) }
  let(:movie) { create(:movie) }
  let(:headers) { { "Authorization" => create(:session, user: user).token } }
  let!(:review) { create(:review, user: user, movie: movie) }

  describe "GET /reviews" do
    it "returns a list of reviews" do
      get "/reviews", headers: headers
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["reviews"]).to be_an(Array)
    end
  end

  describe "GET /reviews/:id" do
    it "returns a review" do
      get "/reviews/#{review.id}", headers: headers
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["review"]["id"]).to eq(review.id)
    end
  end

  describe "POST /reviews" do
    it "creates a review" do
      params = { review: { rating: 4, comment: "Great!", movie_id: movie.id } }
      post "/reviews", params: params, headers: headers
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)["review"]["comment"]).to eq("Great!")
    end

    it "returns errors for invalid params" do
      post "/reviews", params: { review: { rating: nil } }, headers: headers
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)["errors"]).to be_present
    end
  end

  describe "PATCH /reviews/:id" do
    it "updates a review" do
      patch "/reviews/#{review.id}", params: { review: { comment: "Updated" } }, headers: headers
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["review"]["comment"]).to eq("Updated")
    end
  end

  describe "DELETE /reviews/:id" do
    it "deletes a review" do
      delete "/reviews/#{review.id}", headers: headers
      expect(response).to have_http_status(:no_content)
    end
  end
end
