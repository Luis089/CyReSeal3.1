class RemoveUserIdFromResults < ActiveRecord::Migration[6.0]
  def change
    remove_column :results, :user_id, :integer
  end
end
