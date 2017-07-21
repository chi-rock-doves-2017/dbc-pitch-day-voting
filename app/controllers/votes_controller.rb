class VotesController < ApplicationController
	def index
    # Switch assignment of @votes with commented out line 4 once sign is working
    # current_user.votes.order(:rank)
    if current_user.phase_3?
      current_user.make_round_votes(current_user.cohort.pitches, 1)
      @votes = current_user.votes.order(:rank)
    end
  end

  def create
  end

  def update
    @vote = Vote.find(params[:vote_id])
    if params[:change_value] == 1
      @vote.rank_up
    else
      @vote.rank_down
    end
    redirect_to votes_path
  end
end
