class AddUserIdToResults < ActiveRecord::Migration[6.0]
  def change
    add_column :results, :user_id, :integer
  end
end
