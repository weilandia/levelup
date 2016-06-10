require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "with github" do
    VCR.use_cassette("github.login") do
      stub_github_omniauth

      visit "/"
      click_on "sign in with github"

      expect(page).to_not have_content("sign in with github")
      expect(page).to have_content("sign out")
    end
  end
end
