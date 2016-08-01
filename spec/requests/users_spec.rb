require 'rails_helper'

RSpec.describe "Users", type: :request do


  let!(:user) do
    User.create(email: "email@test.com", name: "test", password: "password")
  end

  describe "POST /api/v1/users" do
    context "when all credentials are provided" do
      it "will create a user" do
        expect{ post_user }.to change(User, :count).by(1)
      end
    end

    context "when not all creadentials are provided" do
      it "will not create a use without password" do
        expect{ post_user(password: "") }.not_to change(User, :count)
      end

      it "will not create a use without email" do
        expect{ post_user(email: "") }.not_to change(User, :count)
      end

      it "will not create a use without username" do
        expect{ post_user(name: "") }.not_to change(User, :count)
      end

    end
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

  describe "PATCH /api/v1/users/:id" do
    it "will update user location" do
      expect do
        update_location(user.id, {"lat" => 51.454513, "lng" => -0.0732808 })
      end.to (change{ User.find(user.id).lng }.from(nil).to(-0.0732808) &&
        change{ User.find(user.id).lat }.from(nil).to(51.454513))

    end


  end
end
