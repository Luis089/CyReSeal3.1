class AddQuizIdToroles < ActiveRecord::Migration[6.0]
  def change
    add_column :roles, :quiz_id, :integer
  end
end
