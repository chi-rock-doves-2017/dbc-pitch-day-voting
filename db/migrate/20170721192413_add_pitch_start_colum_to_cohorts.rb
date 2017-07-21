class AddPitchStartColumToCohorts < ActiveRecord::Migration[5.1]
  def change
    add_column :cohorts, :pitch_start, :datetime
    add_column :cohorts, :pitch_end, :datetime
  end
end
