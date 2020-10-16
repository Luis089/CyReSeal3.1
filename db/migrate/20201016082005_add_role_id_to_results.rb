class AddroleIdToResults < ActiveRecord::Migration[6.0]
  def change
    add_column :results, :role_id, :integer
  end
end
