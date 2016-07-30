require 'rails_helper'

describe "Enemies", type: :request do

  before(:each) do
    User.create(email: "email@test.com", name: "test", password: "password")
    @user = User.create(email: "email1@test.com", name: "test1", password: "password")

    UserLocation.create(lat: 51.519678, lng: -0.07569209, user_id: @user.id)
    enemy = Enemy.create(name: "Spitafields Monster", active: true, size: 1)
    EnemyLocation.create(lat: 51.51734, lng: -0.0732808, enemy_id: 1)
  end

  describe "GET /api/v1/enemies" do
    context "when user is authenticated" do
      it "will return the list of enemies within range" do
        get "/api/v1/enemies", headers:{ "HTTP_AUTHORIZATION" => "Token token=\"#{@user.api_key}\""}

        expect(response).to have_http_status(200)
      end


    end
  end



end
