class AddRankToVotes < ActiveRecord::Migration[5.1]
  def change
    add_column :votes, :rank, :integer
  end
end
