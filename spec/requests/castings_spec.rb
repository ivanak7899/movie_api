require 'rails_helper'

RSpec.describe "Castings API", type: :request do
  let(:admin) { create(:user, role: :admin) }
  let(:headers) { { "Authorization" => create(:session, user: admin).token } }
  let!(:casting) { create(:casting) }

  describe "GET /castings" do
    it "returns a list of castings" do
      get "/castings", headers: headers
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["castings"]).to be_an(Array)
    end
  end

  describe "GET /castings/:id" do
    it "returns a casting" do
      get "/castings/#{casting.id}", headers: headers
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["casting"]["id"]).to eq(casting.id)
    end
  end

  describe "POST /castings" do
    it "creates a casting" do
      params = { casting: { movie_id: create(:movie).id, person_id: create(:person).id, role_name: "Lead" } }
      post "/castings", params: params, headers: headers
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)["casting"]["role_name"]).to eq("Lead")
    end
  end

  describe "PATCH /castings/:id" do
    it "updates a casting" do
      patch "/castings/#{casting.id}", params: { casting: { role_name: "Updated" } }, headers: headers
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["casting"]["role_name"]).to eq("Updated")
    end
  end

  describe "DELETE /castings/:id" do
    it "deletes a casting" do
      delete "/castings/#{casting.id}", headers: headers
      expect(response).to have_http_status(:no_content)
      expect(Casting.exists?(casting.id)).to be_falsey
    end
  end
end
