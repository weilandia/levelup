require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "with github" do
    VCR.use_cassette("github.login") do
      stub_omniauth('github')
      visit "/"
      click_on "signin with github"

      expect(Authorization.first.provider).to eq('github')
      expect(page).to_not have_content("signin with github")
      expect(page).to have_content("logout")
    end
  end

  scenario "with facebook" do
    VCR.use_cassette("facebook.login") do
      stub_omniauth('facebook')

      visit "/"
      click_on "signin with facebook"

      expect(Authorization.first.provider).to eq('facebook')
      expect(page).to_not have_content("signin with facebook")
      expect(page).to have_content("logout")
    end
  end
end
