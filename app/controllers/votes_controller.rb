class VotesController < ApplicationController
	def index
    # Switch assignment of @votes with commented out line 4 once sign is working
    # current_user.votes.order(:rank)
		@votes = User.find(13).votes.order(:rank)
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
