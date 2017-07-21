require 'rails_helper'

feature "admin page display" do
  context "when an admin visits admin page" do
    scenario "they see the admin page" do
      visit '/admin'
      expect(page).to to_have_current_path admin_path
    end

    scenario "an Admin can see a 'Pitch Day Start' button" do

    end
  end
end
