module Omniauth
  def stub_github_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    provider: 'github',
    uid: "1",
    info: { name: "Nick",
            nickname: "weilandia"},
    credentials: { token: ENV['GITHUB_USER_TOKEN']},
    extra: { raw_info: {
          avatar_url: "https://avatars3.githubusercontent.com/u/13652979?v=3&u=4b2548366e2f82029320102fd434d968efde206b&s=140"}}})
  end
end

RSpec.configure do |config|
  config.include Omniauth
end
