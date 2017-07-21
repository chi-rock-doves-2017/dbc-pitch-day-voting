class Pitch < ApplicationRecord
  belongs_to :user
  has_many :votes

  def score(round)
    rank_score = {1=>5, 2=>4, 3=>3, 4=>2, 5=>1}
    self.votes
    .where(vote_round: round)
    .reduce(0) do |total, vote|
      total + rank_score[vote.rank]
    end
  end

end
