require 'rails_helper'

RSpec.describe Vote, type: :model do
  before(:all) do
    user = User.create(nickname: "dhnaranjo", name: "tom tom", email: "tom@tom.com", uid: "123456", provider: "github", token: "654321", cohort: Cohort.find_by(name: 'Rock Doves'))
    pitch1 = Pitch.create(title: "Some pitch", description: "This shit is perfect", pitchers: "#{user.name}", user: user)
    pitch2 = Pitch.create(title: "Some pitch2", description: "This shit is perfect,better than the first", pitchers: "#{user.name}", user: user)
    vote1 = Vote.create(voter: user, pitch: pitch1)
    vote2 = Vote.create(voter: user, pitch: pitch2)
  end
  after(:all) do
    User.destroy_all
    Vote.destroy_all
    Pitch.destroy_all
  end
  let(:user) { User.last }
  let(:vote1) { Vote.first }
  let(:pitch1) { Pitch.first }
  let(:vote2) { Vote.last }
  let(:pitch2) { Pitch.last }
  describe "has attribute" do
    it "belongs to a voter" do
      expect(vote1.voter).to eq user
    end
    it "belogs to a pitch" do
      expect(vote1.pitch).to eq pitch1
    end
  end
  describe "rank_up method" do
    context "not the first vote" do
      it "moves up one rank" do
        expect{ vote2.rank_up }.to change{ vote2.pitch }.from(pitch2).to(pitch1)
        expect(vote1.pitch).to eq pitch2

      end
    end
    context 'the first vote' do
      it "does nothing" do
        expect{ vote1.rank_up }.to_not change{ vote1.pitch }
      end
    end
    context "not the first vote" do
      it "moves down one rank" do
        expect{ vote1.rank_down }.to change{ vote1.pitch }.from(pitch1).to(pitch2)
        expect(vote2.pitch).to eq pitch1
      end
    end
    context 'the last vote' do
      it "does nothing" do
        expect{ vote2.rank_down }.to_not change{ vote2.pitch }
      end
    end
  end
end
