class User < ApplicationRecord
  belongs_to :cohort
  has_many :pitches
  has_many :votes, foreign_key: 'voter_id'

  def self.find_or_create_from_auth(auth)
    nickname = auth['info']['nickname']
    valid_user = ValidUser.find_by(nickname: nickname)
    if valid_user
      user = User.find_or_create_by(provider: auth['provider'], uid: auth['uid'])

      user.nickname = nickname
      user.name = auth['info']['name']
      user.email = auth['info']['email']
      user.token = auth['credentials']['token']
      user.cohort = valid_user.cohort

      user.save
      user
    else
      false
    end
  end

  def make_round_votes(array_of_pitches, round)
    # MUST BE MODIFIED FOR PITCHES IN CURRENT COHORT
    if self.votes.count < array_of_pitches.count
      array_of_pitches.each_with_index do |pitch, index|
        Vote.find_or_initialize_by(voter: self, pitch: pitch)
        .update_attributes!(rank: index + 1, vote_round: round)
      end
    end
    self.votes

  def staff?
    self.cohort.name == 'Staff'
  end

  def phase_3?
    Date.today.between?(self.cohort.start + 15.weeks, self.cohort.end)

  end
end
