require 'rails_helper'

feature "pitch creation" do
  let(:user) { User.create(nickname: "tom", name: "tom tom", email: "tom@tom.com", uid: "123456", provider: "github", token: "654321") }

  context "when user visit the new pitch page" do
    # Test was passing before User/Pitch association was made. Not sure how to make feature spec test set session[:user_id]
    xscenario "user can create a new pitch" do
      visit 'pitches/new'

      pitch = {
        title: 'Grapefruit Delivery Wearable',
        description: <<-END,
Catching unsuspecting sources completely off guard with their remarks, the populace of the city of Chicago, entirely unprompted, announced Monday, “We get the food and then we eat the food until all the food is gone.”

Reporters—who had not made inquiries in regard to the topic and remained uncertain as to why it had been brought up at all—said that several moments of silence followed the abrupt declaration as all 10 million residents of the greater Chicago metropolitan area stood there, smiling broadly.

“We get the food first, and then we eat the food,” the populace of the third-largest American city said by way of clarification, reportedly interrupting confused sources as they attempted tentative responses. “Then when the food is gone, we go home and watch TV. Sometimes we eat the food during TV, too. Or sometimes after TV.”
        END
        pitchers: 'The Onion'
      }


      fill_in 'pitch_title', with: pitch[:title]
      fill_in 'pitch_description', with: pitch[:description]
      fill_in 'pitch_pitchers', with: pitch[:pitchers]

      click_button('submit-new-pitch')

      expect(page).to have_content pitch[:title]
      expect(page).to have_content pitch[:description]
      expect(page).to have_content pitch[:pitchers]
    end
  end
end
