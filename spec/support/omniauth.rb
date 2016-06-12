module Omniauth
  def stub_omniauth(provider)
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[provider.to_sym] = OmniAuth::AuthHash.new({
      provider: provider.downcase,
      uid: ENV["TEST_UID"],
      info: { name: ENV["TEST_USER_NAME"], email: ENV["TEST_USER_EMAIL"] },
      credentials: { token: ENV["FACEBOOK_TEST_USER_TOKEN"]}
    })
  end
end

RSpec.configure do |config|
  config.include Omniauth
end
