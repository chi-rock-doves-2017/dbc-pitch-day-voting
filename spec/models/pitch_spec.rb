require 'rails_helper'

describe 'Pitch' do
  let(:user) { User.create(nickname: "tom", name: "tom tom", email: "tom@tom.com", uid: "123456", provider: "github", token: "654321")}

  it "A user can create a pitch" do
    expect(user.pitches.new(title: "FakeApp Idea", description: "This is an app.", pitchers: "tom, tim, tim tom")).to be_a_new Pitch
  end

  describe "when a user creates a new pitch" do
    it "a user's number of pitches is increased" do
      expect{ user.pitches.create(title: "FakeApp Idea", description: "This is an app.", pitchers: "tom, tim, tim tom") }.to change{ user.pitches.count }.from(0).to(1)
    end

    it "a user's last pitch title matches their entry" do
      pitch_params = {title: "FakeApp Idea", description: "This is an app.", pitchers: "tom, tim, tim tom"}
      user.pitches.create(pitch_params)
      expect(user.pitches.last.title).to eq pitch_params[:title]
    end
  end
end
