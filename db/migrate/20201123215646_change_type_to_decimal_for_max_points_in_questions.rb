class ChangeTypeToDecimalForMaxPointsInQuestions < ActiveRecord::Migration[6.0]
  def change
    change_column :questions, :max_points, :decimal
  end
end
