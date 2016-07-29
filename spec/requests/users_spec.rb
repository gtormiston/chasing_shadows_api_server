require 'rails_helper'

RSpec.describe "Users", type: :request do


  let!(:user) do
    User.create(email: "email@test.com", name: "test", password: "password")
  end




  describe "GET /api/v1/users" do
    it "Will authenticate user with token" do

      get "/api/v1/users", headers:{ "HTTP_AUTHORIZATION" => "Token token=\"#{user.api_key}\""}

      expect(response).to have_http_status(200)
    end

    it "Will not authenticate a user without a token" do
      get "/api/v1/users"
      expect(response).to have_http_status(401)

    end
  end
end
