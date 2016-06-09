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
      expect(user_response[:email]).to eq(@user.email)
    end

    it { should respond_with 200 }
  end
end
