class AddAttemptIdToResults < ActiveRecord::Migration[6.0]
  def change
    add_column :results, :attempt_id, :integer
  end
end
