require 'rails_helper'

RSpec.describe "Session API", type: :request do
  let(:user) { create(:user, password: "password123") }

  describe "POST /session" do
    it "creates a session with valid credentials" do
      post "/session", params: { session: { email: user.email, password: "password123" } }
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)["session"]).to be_present
    end

    it "returns error with invalid credentials" do
      post "/session", params: { session: { email: user.email, password: "wrong" } }
      expect(response).to have_http_status(:unauthorized)
      expect(JSON.parse(response.body)["errors"]).to be_present
    end
  end

  describe "DELETE /session" do
    let(:session) { create(:session, user: user) }
    let(:headers) { { "Authorization" => session.token } }

    it "destroys the session with valid token" do
      delete "/session", headers: headers
      expect(response).to have_http_status(:no_content)
    end

    it "returns error with invalid token" do
      delete "/session", headers: { "Authorization" => "badtoken" }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
