require 'rails_helper'

RSpec.describe "Users API", type: :request do
  let(:admin) { create(:user, role: :admin) }
  let(:headers) { { "Authorization" => create(:session, user: admin).token } }

  describe "GET /users" do
    it "returns a list of users" do
      create_list(:user, 3)
      get "/users", headers: headers
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["users"].size).to eq(4) # including admin
    end
  end

  describe "GET /users/:id" do
    it "returns a user" do
      user = create(:user)
      get "/users/#{user.id}", headers: headers
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["user"]["id"]).to eq(user.id)
    end
  end

  describe "POST /users" do
    it "creates a user" do
      user_params = attributes_for(:user)
      post "/users", params: { user: user_params }, headers: headers
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)["user"]["email"]).to eq(user_params[:email])
    end
  end

  describe "PATCH /users/:id" do
    it "updates a user" do
      user = create(:user)
      patch "/users/#{user.id}", params: { user: { username: "newname" } }, headers: headers
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["user"]["username"]).to eq("newname")
    end
  end

  describe "DELETE /users/:id" do
    it "deletes a user" do
      user = create(:user)
      delete "/users/#{user.id}", headers: headers
      expect(response).to have_http_status(:no_content)
    end
  end
end
