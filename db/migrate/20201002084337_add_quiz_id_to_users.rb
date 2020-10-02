class AddQuizIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :quiz_id, :integer
  end
end
