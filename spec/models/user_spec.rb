require 'rails_helper'

describe User do

  before(:all) do
    User.create(nickname: "dhnaranjo", name: "tom tom", email: "tom@tom.com", uid: "123456", provider: "github", token: "654321", cohort: Cohort.find_by(name: 'Rock Doves'))
  end

  let(:user) { User.last }

  after(:all) do
    User.destroy_all
  end

  describe "has attribute" do
    it "nickname" do
      expect(user.nickname).to eq "dhnaranjo"
    end

    it "uid" do
      expect(user.uid).to eq "123456"
    end

    it "name" do
      expect(user.name).to eq "tom tom"
    end

    it "provider" do
      expect(user.provider).to eq "github"
    end

    it "token" do
      expect(user.token).to eq "654321"
    end

    it "email" do
      expect(user.email).to eq "tom@tom.com"
    end
  end

  xdescribe "has a class method self.find_or_create_from_auth" do
    context 'when user exists' do
      it "finds the user" do
        auth =  {
          'provider' => 'github',
          'info' => {
            'nickname' => 'dhnaranjo',
            'name' => 'tom tom',
            'email' => 'tom@tom.com'
          },
          'credentials' => {
            'token' => '654321'
          },
          'uid' => '123456'
        }

        expect(User.find_or_create_from_auth(auth)).to eq user
      end
    end

    context 'when user is new' do
      it "user is not found in database" do
        expect(User.find_by(uid: 1234982347)).to be nil
      end

      it "creates a new user" do
        auth =  {
          'provider' => 'github',
          'info' => {
            'nickname' => 'kvrag',
            'name' => 'tim tim',
            'email' => 'tim@tim.com'
          },
          'credentials' => {
            'token' => '654321'
          },
          'uid' => '1234982347'
        }

        expect(User.find_or_create_from_auth(auth)).to be_an_instance_of User
      end
    end
  end
end
