class CreateValidUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :valid_users do |t|
      t.text :nickname
      t.references :cohort, foreign_key: true
    end
  end
end
