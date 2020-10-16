class AddQuizIdToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :quiz_id, :integer
  end
end
