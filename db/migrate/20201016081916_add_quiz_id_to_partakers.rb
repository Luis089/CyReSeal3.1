class AddQuizIdToPartakers < ActiveRecord::Migration[6.0]
  def change
    add_column :partakers, :quiz_id, :integer
  end
end
