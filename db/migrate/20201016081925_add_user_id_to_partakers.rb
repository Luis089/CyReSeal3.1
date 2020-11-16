class AddUserIdToPartakers < ActiveRecord::Migration[6.0]
  def change
    add_column :partakers, :user_id, :integer
  end
end
