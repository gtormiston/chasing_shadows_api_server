require 'rails_helper'
require 'json'

describe "Sessions", type: :request do

  before(:each) do
    @user = User.create(email: "email1@test.com",
                        name: "test1",
                        password: "password",
                        password_confirmation: "password",
                        lat: 51.519678, lng: -0.07569209)
  end


  describe "POST /api/v1/sessions" do
    context "when already signed up" do
      it "will authenticate and return the user" do
        log_in
        expect(JSON.parse(response.body)["name"]).to eq "test1"
      end

      it "will return erros if user is not authenticated" do
        log_in(name: "something")
        expect(JSON.parse(response.body)["error"]).to eq "Invalid credentials"
      end
    end

  end


end
