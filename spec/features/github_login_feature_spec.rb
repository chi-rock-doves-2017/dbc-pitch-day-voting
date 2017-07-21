require 'rails_helper'

feature 'github login' do
  scenario 'the not logged in user sees a button to sign in with Github' do
    visit "/"

    expect(page).to have_link("Sign in with Github", href: "/auth/github")
  end
  xscenario 'the logged in user sees a link to log out' do
    visit "/"
    click_link 'Sign in with Github'

    #OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
     # provider: 'github',
    #  uid: '12345'
   # })
    # click_button '#js-oauth-authorize-btn'
    expect(page).to have_link("Log Out", href: "/logout")
  end
end
