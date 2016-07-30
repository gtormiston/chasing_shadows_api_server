require 'rails_helper'
require 'json'

describe "Enemies", type: :request do

  before(:each) do
    @user = User.create(email: "email1@test.com", name: "test1", password: "password")

    UserLocation.create(lat: 51.519678, lng: -0.07569209, user_id: @user.id)
    @spitafileds_monster = Enemy.create(name: "Spitafields Monster", active: true, size: 1,lat: 51.51734, lng: -0.0732808)
    @inactive_monster = Enemy.create(name: "Inactive Monster", active: false, size: 1,lat: 51.51734, lng: -0.0732808)
    @bristol_monster = Enemy.create(name: "Bristol Monster", active: true, size: 1,lat: 51.454513, lng: 2.5879099999999)

  end

  describe "GET /api/v1/enemies" do
    context "when user is authenticated" do
      it "will return the list of enemies within range" do
        get "/api/v1/enemies", headers:{ "HTTP_AUTHORIZATION" => "Token token=\"#{@user.api_key}\""}
        expect(monster_names(response.body)).to include("Spitafields Monster")
      end

      it "will only return active enemies" do
        get "/api/v1/enemies", headers:{ "HTTP_AUTHORIZATION" => "Token token=\"#{@user.api_key}\""}
        expect(monster_names(response.body)).not_to include("Inactive Monster")
      end

      it "will not return enemies that are not in range" do
        get "/api/v1/enemies", headers:{ "HTTP_AUTHORIZATION" => "Token token=\"#{@user.api_key}\""}
        expect(monster_names(response.body)).not_to include("Bristol Monster")
      end
    end

    context "when user is not authenticated" do
      it "will respond with a 401" do
        get "/api/v1/enemies", headers:{ "HTTP_AUTHORIZATION" => "Token token=\"ABCDEFGHDASFDDS\""}
        expect(response).to have_http_status(401)
      end
    end
  end

  describe "PATCH /api/v1/enemies/:id" do
    context "when user is authenticated" do
      it "will reduce the HP of an enemy within range by 1" do
        mon_id = @spitafileds_monster.id
        expect do
          attack_enemy(mon_id)
        end.to change{Enemy.find(mon_id).size}.from(1).to(0)
      end

    end


  end



end
