require 'rails_helper'

describe Api::V1::UsersController do
  describe "GET #show" do
    it "returns information about a user in a hash" do
      user = Fabricate(:user)
      get :show, id: user.id, format: :json
      user_response = JSON.parse(response.body, symbolize_names: true)
      expect(user_response[:data][:attributes][:email]).to eq(user.email)
    end
  end
end
