class User < ApplicationRecord
  belongs_to :cohort
  has_many :pitches

  def self.find_or_create_from_auth(auth)
    nickname = auth['info']['nickname']
    valid_user = ValidUser.find_by(nickname: nickname)
    
   # byebug

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
end
