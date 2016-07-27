require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /api/v1/users" do
    it "User path runs" do
      get '/api/v1/users'
      expect(response).to have_http_status(200)
    end
  end
end
