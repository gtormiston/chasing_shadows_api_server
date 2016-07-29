require 'rails_helper'

RSpec.describe "Users", type: :request do


  let!(:user) do
    User.create(email: "email@test.com", name: "test", password: "password")
  end




  describe "GET /api/v1/users" do
    it "User path runs" do

      get "/api/v1/users", headers:{ "HTTP_AUTHORIZATION" => "Token token=\"#{user.api_key}\""}
      # ,{ 'HTTP_AUTHORIZATION'=>"Token token=\"#{user.api_key}\""}
      # p request
      expect(response).to have_http_status(200)
    end
  end
end
