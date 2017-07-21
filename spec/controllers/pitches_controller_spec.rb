require 'rails_helper'

describe PitchesController do
  let(:user) { User.create(nickname: "tom", name: "tom tom", email: "tom@tom.com", uid: "123456", provider: "github", token: "654321") }

  describe "GET #index" do
    it "responds with status 200" do
      get :index
      expect(response).to have_http_status(200)
    end
    it "renders the :index template" do
      get :index
      expect(response).to render_template("index")
    end
    it "loads all pitches into @pitches" do
      get :index
      pitch_one = {
        title: Faker::Lovecraft.sentence,
        description: Faker::Lovecraft.paragraphs(3).join(" "),
        pitchers: Faker::Lovecraft.deity,
        user_id: user.id
      }
      pitch_two = {
        title: Faker::Lovecraft.sentence,
        description: Faker::Lovecraft.paragraphs(3).join(" "),
        pitchers: [Faker::Lovecraft.deity, Faker::Lovecraft.deity],
        user_id: user.id
      }

      Pitch.create(pitch_one)
      Pitch.create(pitch_two)
      expect(Pitch.all.count).to eq 2
      expect(assigns(:pitches)).to eq Pitch.all
    end
  end

  describe "GET #new" do
    it "responds with status 200" do
      get :new
      expect(response).to have_http_status(200)
    end
    it "assigns a new user to @user" do
      get :new
      expect(assigns(:pitch)).to be_a Pitch
      expect(assigns(:pitch)).to_not be_persisted
    end
    it "renders the :index template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do

      def create_pitch
        post :create, params: { pitch: { title: 'Killer Pitch!', description: "DISRUPTION!", pitchers: "Frankie!", user_id: user.id } }
      end

      it "responds with status code 302" do
        create_pitch
        expect(response).to have_http_status(302)
      end

      it "creates a new pitch in the database" do
        expect { create_pitch }.to change { Pitch.count }.by 1
      end

      it "sets a notice that the user was successfully created" do
        create_pitch
        expect(flash[:notice]).to eq 'pitch was successfully created.'
      end

      it "redirects to pitches#index" do
        create_pitch
        expect(response).to redirect_to pitches_path
      end
    end
  end
end
