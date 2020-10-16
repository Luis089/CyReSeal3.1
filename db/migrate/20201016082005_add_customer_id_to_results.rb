class AddCustomerIdToResults < ActiveRecord::Migration[6.0]
  def change
    add_column :results, :customer_id, :integer
  end
end
