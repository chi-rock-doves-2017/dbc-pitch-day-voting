require 'rails_helper'

feature 'cohort selection' do
  let(:user) { User.create(
    nickname: "wow",
    name: "Oh Wow",
    email: "oh@wow.com",
    uid: 12345,
    provider: "github"
  )}
  context "when a user has not selected a cohort" do
    scenario "the user is redirected to their profile" do

      visit '/pitches'
      expect(current_path).to eql use
