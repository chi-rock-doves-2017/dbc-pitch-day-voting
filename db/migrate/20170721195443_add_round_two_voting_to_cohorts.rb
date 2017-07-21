class AddRoundTwoVotingToCohorts < ActiveRecord::Migration[5.1]
  def change
  	add_column :cohorts, :round_two_voting_start, :datetime
    add_column :cohorts, :round_two_voting_end, :datetime
  end
end
