require 'rails_helper'

describe Api::V1::UsersController do
  before(:each) { request.headers['Accept'] = "application/vnd.levelup.vq" }

  describe "GET #show" do
    before(:each) do
      @user = Fabricate(:user)
      get :show, id: @user.id, format: :json
    end

    it "returns information about a user in a hash" do
      user_response = JSON.parse(response.body, symbolize_names: true)
      expect(user_response[:data][:attributes][:email]).to eq(@user.email)
    end

    it { should respond_with 200 }
  end

  describe "POST #create" do
    context "when is successfully created" do
      before(:each) do
        @user_attributes = Fabricate.attributes_for(:user)
        post :create, { user: @user_attributes }, format: :json
      end

      it "renders the json representation for the user record just created" do
        require "pry"; binding.pry
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:data][:attributes][:email]).to eq(@user_attributes[:email])
      end

      it { should respond_with 201 }
    end

    context "when is not created" do
      before(:each) do
        @invalid_user_attributes = { password: "password", password_confirmation: "password" }

        post :create, { user: @invalid_user_attributes }, format: :json
      end

      it "renders a json error" do
        user_response = JSON.parse(response.body, symbolize_name: true)
        expect(user_response[:errors][:email]).to include "can't be blank"
      end

      it { should respond_with 422 }
    end
  end
end
