require 'rails_helper'

RSpec.describe "People API", type: :request do
  let(:admin) { create(:user, role: :admin) }
  let(:headers) { { "Authorization" => create(:session, user: admin).token } }
  let!(:person) { create(:person) }

  describe "GET /people" do
    it "returns a list of people" do
      get "/people", headers: headers
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["people"]).to be_an(Array)
    end
  end

  describe "GET /people/:id" do
    it "returns a person" do
      get "/people/#{person.id}", headers: headers
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["person"]["id"]).to eq(person.id)
    end
  end

  describe "POST /people" do
    it "creates a person" do
      params = { person: { name: "New Person" } }
      post "/people", params: params, headers: headers
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)["person"]["name"]).to eq("New Person")
    end
  end

  describe "PATCH /people/:id" do
    it "updates a person" do
      patch "/people/#{person.id}", params: { person: { name: "Updated" } }, headers: headers
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["person"]["name"]).to eq("Updated")
    end
  end

  describe "DELETE /people/:id" do
    it "deletes a person" do
      delete "/people/#{person.id}", headers: headers
      expect(response).to have_http_status(:no_content)
    end
  end
end
