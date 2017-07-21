class AddRoundOneVotingToCohorts < ActiveRecord::Migration[5.1]
  def change
    add_column :cohorts, :round_one_voting_start, :datetime
    add_column :cohorts, :round_one_voting_end, :datetime
  end
end
