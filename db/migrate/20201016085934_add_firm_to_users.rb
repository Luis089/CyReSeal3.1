class AddFirmToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :firm, :string
  end
end
