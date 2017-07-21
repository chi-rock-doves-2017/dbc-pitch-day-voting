class Vote < ApplicationRecord
  belongs_to :voter, class_name: :User
  belongs_to :pitch

  def rank_up
    if self != self.voter
      .votes
      .where(vote_round: self.vote_round)
      .order(:rank)
      .first
      higher_vote = Vote.find_by(rank: self.rank - 1)
      self.rank, higher_vote.rank = higher_vote.rank, self.rank
      byebug
      self.save
      higher_vote.save
    end
    self
  end

  def rank_down
    if self != self.voter
      .votes
      .where(vote_round: self.vote_round)
      .order(:rank)
      .last
      lower_vote = Vote.find_by(rank: self.rank + 1)
      self.rank, lower_vote.rank = lower_vote.rank, self.rank
      self.save
      lower_vote.save
    end
    self
  end
end
