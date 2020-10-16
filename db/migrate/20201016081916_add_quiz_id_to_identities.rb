class AddQuizIdToIdentities < ActiveRecord::Migration[6.0]
  def change
    add_column :identities, :quiz_id, :integer
  end
end
