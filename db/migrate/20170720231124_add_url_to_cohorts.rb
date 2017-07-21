class AddUrlToCohorts < ActiveRecord::Migration[5.1]
  def change
    add_column :cohorts, :url, :text
  end
end
