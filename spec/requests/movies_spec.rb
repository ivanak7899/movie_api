require 'rails_helper'

RSpec.describe "Movies API", type: :request do
  let(:admin) { create(:user, role: :admin) }
  let(:headers) { { "Authorization" => create(:session, user: admin).token } }
  let!(:movie) { create(:movie) }

  describe "GET /movies" do
    it "returns a list of movies" do
      get "/movies", headers: headers
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["movies"]).to be_an(Array)
    end
  end

  describe "GET /movies/:id" do
    it "returns a movie" do
      get "/movies/#{movie.id}", headers: headers
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["movie"]["id"]).to eq(movie.id)
    end
  end

  describe "POST /movies" do
    it "creates a movie" do
      params = { movie: { title: "New Movie", description: "Desc", release_year: 2020, director_id: create(:person).id } }
      post "/movies", params: params, headers: headers
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)["movie"]["title"]).to eq("New Movie")
    end
  end

  describe "PATCH /movies/:id" do
    it "updates a movie" do
      patch "/movies/#{movie.id}", params: { movie: { title: "Updated" } }, headers: headers
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["movie"]["title"]).to eq("Updated")
    end
  end

  describe "DELETE /movies/:id" do
    it "deletes a movie" do
      delete "/movies/#{movie.id}", headers: headers
      expect(response).to have_http_status(:no_content)
    end
  end
end
