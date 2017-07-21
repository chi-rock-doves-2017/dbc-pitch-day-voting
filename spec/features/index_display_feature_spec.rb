require 'rails_helper'

feature 'index content display' do
   let(:user) { User.create(nickname: "tom", name: "tom tom", email: "tom@tom.com", uid: "123456", provider: "github", token: "654321") }

  context 'when a user is logged in' do
    scenario 'sees pitches on the index' do
      pitch_one = {
        title: Faker::Lovecraft.sentence,
        description: Faker::Lovecraft.paragraphs(3).join(" "),
        pitchers: Faker::Lovecraft.deity,
        user_id: user.id
      }
      pitch_two = {
        title: Faker::Lovecraft.sentence,
        description: Faker::Lovecraft.paragraphs(3).join(" "),
        pitchers: "#{Faker::Lovecraft.deity}, #{Faker::Lovecraft.deity}",
        user_id: user.id
      }
      pitch_obj_one = Pitch.create(pitch_one)
      pitch_obj_two = Pitch.create(pitch_two)

      visit '/pitches'

      expect(page).to have_content pitch_obj_one.title
      expect(page).to have_content pitch_obj_one.pitchers
      expect(page).to have_content pitch_obj_two.description
      expect(page).to have_content pitch_obj_two.pitchers
    end
  end
end
