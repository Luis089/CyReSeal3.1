class AddUserIdToIdentities < ActiveRecord::Migration[6.0]
  def change
    add_column :identities, :user_id, :integer
  end
end
